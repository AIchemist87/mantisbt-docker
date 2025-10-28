# MantisBoT AI - MantisBT Integration Documentation

**Internal Document - Not for Public Distribution**

This document provides technical details for integrating an AI chatbot with this MantisBT installation. It contains API endpoints, authentication methods, and data schemas necessary for building the MantisBoT AI project.

## Table of Contents

- [System Overview](#system-overview)
- [Authentication](#authentication)
- [REST API Endpoints](#rest-api-endpoints)
- [Data Schemas](#data-schemas)
- [Integration Best Practices](#integration-best-practices)
- [Security Considerations](#security-considerations)
- [Example API Calls](#example-api-calls)
- [Error Handling](#error-handling)
- [Testing Recommendations](#testing-recommendations)

## System Overview

### MantisBT Instance Details

- **Version:** MantisBT 2.27.1
- **Base URL:** `http://localhost:8989/`
- **REST API Base:** `http://localhost:8989/api/rest/`
- **Web Interface:** `http://localhost:8989/my_view_page.php`

### Docker Environment

The MantisBT instance runs in a Docker environment with two services:

1. **MantisBT Service** (`mantis`)
   - Port: 8989:80
   - Image: xlrl/mantisbt:latest
   - Platform: linux/amd64

2. **MariaDB Service** (`db`)
   - Internal port: 3306
   - Database: `bugtracker`
   - User: `mantisbt`
   - Password: Configured in `config/config_inc.php`

### Database Schema

MantisBT uses the following main tables:
- `mantis_user_table` - Users and authentication
- `mantis_project_table` - Projects
- `mantis_bug_table` - Issues (bugs)
- `mantis_bug_text_table` - Issue descriptions
- `mantis_bugnote_table` - Notes/comments
- `mantis_bug_history_table` - Issue change history
- `mantis_category_table` - Issue categories
- `mantis_custom_field_table` - Custom fields

## Authentication

### API Token Authentication

MantisBT uses API tokens for authentication. Each user can generate an API token from their account.

#### Creating a Read-Only API User

**Recommended Approach for Chatbot:**

1. Log in as administrator
2. Go to **Manage → Manage Users**
3. Create new user:
   - Username: `mantisbot_api`
   - Real Name: `MantisBoT AI (Read-Only)`
   - Email: `mantisbot@localhost.local`
   - Access Level: **Viewer** (read-only)
4. Set a strong password
5. Go to user profile → API Tokens
6. Generate new token with name "ChatBot Integration"
7. Copy the token (you'll only see it once!)

#### Token Usage

```bash
# HTTP Header
Authorization: YOUR_API_TOKEN_HERE

# Example with curl
curl -H "Authorization: YOUR_API_TOKEN_HERE" \
  http://localhost:8989/api/rest/issues
```

### Environment Variables

Store credentials securely:

```env
MANTIS_BASE_URL=http://localhost:8989/api/rest
MANTIS_API_TOKEN=your_generated_api_token_here
OPENAI_API_KEY=your_openai_api_key_here
```

## REST API Endpoints

### Base URL

```
http://localhost:8989/api/rest/
```

### Available Endpoints

#### 1. Get All Issues

```http
GET /issues
```

**Query Parameters:**
- `page_size` - Number of results per page (default: 50, max: 100)
- `page` - Page number (default: 1)
- `project_id` - Filter by project ID
- `filter_id` - Apply a saved filter

**Response Structure:**
```json
{
  "issues": [
    {
      "id": 31696,
      "summary": "Issue title",
      "description": "Detailed description",
      "project": { "id": 1, "name": "Project Name" },
      "category": { "id": 2, "name": "General" },
      "reporter": { "id": 3, "name": "John Doe", "email": "john@example.com" },
      "status": { "id": 10, "name": "new", "label": "new" },
      "resolution": { "id": 10, "name": "open", "label": "open" },
      "priority": { "id": 30, "name": "normal", "label": "normal" },
      "severity": { "id": 50, "name": "minor", "label": "minor" },
      "handler": { "id": 4, "name": "Jane Smith" },
      "created_at": "2024-01-15T10:30:00+00:00",
      "updated_at": "2024-01-20T14:45:00+00:00"
    }
  ]
}
```

#### 2. Get Specific Issue

```http
GET /issues/{id}
```

**Path Parameters:**
- `id` - Issue ID

**Returns:** Full issue details including history and notes

#### 3. Get Projects

```http
GET /projects
```

**Returns:** List of all accessible projects

```json
{
  "projects": [
    {
      "id": 1,
      "name": "MantisBT",
      "status": { "id": 10, "name": "development", "label": "development" },
      "description": "Project description",
      "enabled": true,
      "view_state": { "id": 10, "name": "public", "label": "public" }
    }
  ]
}
```

#### 4. Get Users

```http
GET /users
```

**Query Parameters:**
- `page_size` - Number of results per page
- `page` - Page number

**Returns:** List of users (limited by permissions)

#### 5. Get Issue Notes

```http
GET /issues/{id}/notes
```

**Returns:** All notes/comments for a specific issue

#### 6. Get Issue History

```http
GET /issues/{id}/history
```

**Returns:** Complete change history for an issue

#### 7. Get Filters

```http
GET /filters
```

**Returns:** User's saved filters

#### 8. Get Config

```http
GET /config
```

**Returns:** MantisBT configuration options (limited by permissions)

## Data Schemas

### Issue Status Values

```javascript
const STATUS = {
  10: "new",
  20: "feedback",
  30: "acknowledged",
  40: "confirmed",
  50: "assigned",
  80: "resolved",
  90: "closed"
};
```

### Priority Values

```javascript
const PRIORITY = {
  10: "none",
  20: "low",
  30: "normal",
  40: "high",
  50: "urgent",
  60: "immediate"
};
```

### Severity Values

```javascript
const SEVERITY = {
  10: "feature",
  20: "trivial",
  30: "text",
  40: "tweak",
  50: "minor",
  60: "major",
  70: "crash",
  80: "block"
};
```

### Resolution Values

```javascript
const RESOLUTION = {
  10: "open",
  20: "fixed",
  30: "reopened",
  40: "unable to reproduce",
  50: "not fixable",
  60: "duplicate",
  70: "no change required",
  80: "suspended",
  90: "won't fix"
};
```

## Integration Best Practices

### 1. API Call Optimization

**Implement Caching:**
```javascript
// Cache frequently accessed data
const cache = {
  projects: { data: null, timestamp: null, ttl: 300000 }, // 5 minutes
  users: { data: null, timestamp: null, ttl: 600000 },    // 10 minutes
  config: { data: null, timestamp: null, ttl: 3600000 }   // 1 hour
};

function getCached(key) {
  const item = cache[key];
  if (item.data && Date.now() - item.timestamp < item.ttl) {
    return item.data;
  }
  return null;
}
```

**Rate Limiting:**
- Implement exponential backoff for failed requests
- Respect API rate limits (if any)
- Queue requests to avoid overwhelming the API

### 2. Query Parsing Patterns

**Common Query Types:**

1. **Count Queries:** "How many issues are open?"
   - Endpoint: `GET /issues?page_size=1`
   - Parse total count from response headers

2. **Filter Queries:** "Show high-priority issues"
   - Endpoint: `GET /issues?page_size=50`
   - Filter client-side by priority.id === 40

3. **User-Specific:** "What is John working on?"
   - Endpoint: `GET /issues`
   - Filter by handler.name contains "John" and status !== closed

4. **Date-Based:** "Issues updated last week"
   - Endpoint: `GET /issues`
   - Filter by updated_at within date range

5. **Project-Specific:** "Blockers in Project Alpha"
   - Endpoint: `GET /issues`
   - Filter by project.name === "Alpha" and severity === "block"

### 3. Natural Language Processing

**Intent Recognition:**

```javascript
const intentPatterns = {
  COUNT: /how many|count|number of/i,
  LIST: /show|list|display|what are/i,
  SUMMARY: /summarize|summary|overview/i,
  SPECIFIC: /issue #?\d+|bug #?\d+/i,
  STATUS: /status|state/i,
  USER: /assigned to|working on|john|jane/i,
  PRIORITY: /high priority|urgent|immediate/i,
  DATE: /today|yesterday|last week|this week/i
};

function detectIntent(query) {
  for (const [intent, pattern] of Object.entries(intentPatterns)) {
    if (pattern.test(query)) {
      return intent;
    }
  }
  return 'UNKNOWN';
}
```

### 4. Response Formatting

**Structured Responses:**

```javascript
// For ChatGPT to format nicely
const responseFormats = {
  TABLE: "Format as a table with columns: ID, Summary, Priority, Status, Assignee",
  LIST: "Format as a numbered list with brief summaries",
  SUMMARY: "Provide a concise summary with key statistics",
  DETAIL: "Provide detailed information including description and history"
};
```

## Security Considerations

### Read-Only Enforcement

**Never use these HTTP methods:**
- POST (creates new resources)
- PUT (updates resources)
- PATCH (partial updates)
- DELETE (removes resources)

**Only use GET requests:**
- GET /issues
- GET /projects
- GET /users
- etc.

### API Token Security

**Best Practices:**
```javascript
// ❌ BAD - Hardcoded token
const API_TOKEN = "abc123...";

// ✅ GOOD - Environment variable
const API_TOKEN = process.env.MANTIS_API_TOKEN;

// ✅ GOOD - Secure configuration
import { config } from './config.secure.js';
const API_TOKEN = config.mantis.apiToken;
```

**Never log tokens:**
```javascript
// ❌ BAD
console.log(`API Token: ${API_TOKEN}`);

// ✅ GOOD
console.log('API Token: [REDACTED]');
```

### Input Sanitization

**Sanitize user queries:**
```javascript
function sanitizeQuery(query) {
  // Remove potential injection attempts
  return query
    .replace(/<script>/gi, '')
    .replace(/javascript:/gi, '')
    .replace(/on\w+=/gi, '')
    .trim();
}
```

### Error Response Handling

**Don't expose internal details:**
```javascript
// ❌ BAD
return { error: stackTrace };

// ✅ GOOD
return { 
  error: "Unable to fetch issues. Please try again.",
  code: "FETCH_ERROR"
};
```

## Example API Calls

### Using cURL

```bash
# Get all issues
curl -H "Authorization: YOUR_TOKEN" \
  http://localhost:8989/api/rest/issues

# Get specific issue
curl -H "Authorization: YOUR_TOKEN" \
  http://localhost:8989/api/rest/issues/31696

# Get projects
curl -H "Authorization: YOUR_TOKEN" \
  http://localhost:8989/api/rest/projects

# Get issues with pagination
curl -H "Authorization: YOUR_TOKEN" \
  "http://localhost:8989/api/rest/issues?page_size=10&page=1"
```

### Using JavaScript (Node.js)

```javascript
const axios = require('axios');

const mantisAPI = axios.create({
  baseURL: 'http://localhost:8989/api/rest',
  headers: {
    'Authorization': process.env.MANTIS_API_TOKEN
  }
});

// Get all issues
async function getAllIssues() {
  try {
    const response = await mantisAPI.get('/issues');
    return response.data;
  } catch (error) {
    console.error('Error fetching issues:', error.message);
    throw error;
  }
}

// Get specific issue
async function getIssue(issueId) {
  try {
    const response = await mantisAPI.get(`/issues/${issueId}`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching issue ${issueId}:`, error.message);
    throw error;
  }
}

// Filter issues by criteria
async function filterIssues(criteria) {
  const response = await mantisAPI.get('/issues', {
    params: {
      page_size: 100
    }
  });
  
  let issues = response.data.issues;
  
  // Client-side filtering
  if (criteria.priority) {
    issues = issues.filter(i => i.priority.name === criteria.priority);
  }
  
  if (criteria.status) {
    issues = issues.filter(i => i.status.name === criteria.status);
  }
  
  if (criteria.assignee) {
    issues = issues.filter(i => 
      i.handler && i.handler.name.toLowerCase().includes(criteria.assignee.toLowerCase())
    );
  }
  
  return issues;
}
```

### Using Python

```python
import requests
import os

class MantisAPI:
    def __init__(self):
        self.base_url = "http://localhost:8989/api/rest"
        self.headers = {
            "Authorization": os.getenv("MANTIS_API_TOKEN")
        }
    
    def get_issues(self, page_size=50, page=1):
        """Fetch issues with pagination"""
        response = requests.get(
            f"{self.base_url}/issues",
            headers=self.headers,
            params={"page_size": page_size, "page": page}
        )
        response.raise_for_status()
        return response.json()
    
    def get_issue(self, issue_id):
        """Fetch specific issue"""
        response = requests.get(
            f"{self.base_url}/issues/{issue_id}",
            headers=self.headers
        )
        response.raise_for_status()
        return response.json()
    
    def get_projects(self):
        """Fetch all projects"""
        response = requests.get(
            f"{self.base_url}/projects",
            headers=self.headers
        )
        response.raise_for_status()
        return response.json()
    
    def filter_by_priority(self, issues, priority_name):
        """Filter issues by priority"""
        return [i for i in issues if i['priority']['name'] == priority_name]
    
    def filter_by_status(self, issues, status_name):
        """Filter issues by status"""
        return [i for i in issues if i['status']['name'] == status_name]
    
    def filter_by_handler(self, issues, handler_name):
        """Filter issues by assigned user"""
        return [i for i in issues if i.get('handler') and 
                handler_name.lower() in i['handler']['name'].lower()]
```

## Error Handling

### Common Errors

#### 401 Unauthorized
```json
{
  "message": "Unauthorized",
  "code": 401
}
```
**Cause:** Invalid or expired API token  
**Solution:** Verify token, regenerate if needed

#### 403 Forbidden
```json
{
  "message": "Access denied",
  "code": 403
}
```
**Cause:** User doesn't have permission  
**Solution:** Check user access level

#### 404 Not Found
```json
{
  "message": "Issue not found",
  "code": 404
}
```
**Cause:** Resource doesn't exist  
**Solution:** Verify ID, check if issue was deleted

#### 500 Internal Server Error
```json
{
  "message": "Internal server error",
  "code": 500
}
```
**Cause:** Server-side issue  
**Solution:** Check MantisBT logs, verify database connection

### Error Handling Pattern

```javascript
async function safeAPICall(endpoint, options = {}) {
  try {
    const response = await mantisAPI.get(endpoint, options);
    return { success: true, data: response.data };
  } catch (error) {
    if (error.response) {
      // Server responded with error
      return {
        success: false,
        error: error.response.data.message,
        code: error.response.status
      };
    } else if (error.request) {
      // Request made but no response
      return {
        success: false,
        error: "MantisBT server is not responding",
        code: "NO_RESPONSE"
      };
    } else {
      // Request setup error
      return {
        success: false,
        error: "Failed to make request",
        code: "REQUEST_ERROR"
      };
    }
  }
}
```

## Testing Recommendations

### Unit Testing

**Test API client functions:**
```javascript
describe('MantisAPI', () => {
  it('should fetch all issues', async () => {
    const issues = await api.getAllIssues();
    expect(issues).toHaveProperty('issues');
    expect(Array.isArray(issues.issues)).toBe(true);
  });
  
  it('should filter issues by priority', async () => {
    const issues = await api.getAllIssues();
    const highPriority = api.filterByPriority(issues.issues, 'high');
    highPriority.forEach(issue => {
      expect(issue.priority.name).toBe('high');
    });
  });
});
```

### Integration Testing

**Test with actual MantisBT instance:**
```javascript
describe('MantisBT Integration', () => {
  beforeAll(async () => {
    // Ensure MantisBT is running
    const health = await checkMantisHealth();
    expect(health).toBe(true);
  });
  
  it('should authenticate successfully', async () => {
    const projects = await api.getProjects();
    expect(projects).toBeDefined();
  });
  
  it('should handle invalid token', async () => {
    const badAPI = new MantisAPI('invalid_token');
    const result = await badAPI.getAllIssues();
    expect(result.success).toBe(false);
    expect(result.code).toBe(401);
  });
});
```

### Test Data

**Use MantisSeeder plugin to generate test data:**
1. Install MantisSeeder plugin
2. Generate 50-100 test issues
3. Run tests against real data
4. Clean up after tests if needed

## ChatGPT Integration

### Prompt Engineering for MantisBT

**System Prompt Template:**
```
You are MantisBoT AI, an assistant that helps users query MantisBT bug tracking system.

Your capabilities:
- Fetch and analyze issue data
- Filter issues by various criteria
- Provide summaries and statistics
- Answer questions about specific issues

You have access to these MantisBT functions:
- get_all_issues()
- get_issue(id)
- get_projects()
- filter_issues(criteria)

Always:
- Format responses clearly
- Use tables for multiple issues
- Include relevant statistics
- Suggest follow-up questions

Never:
- Modify or create issues
- Change issue status
- Assign issues to users
- Delete data
```

### Function Calling Pattern

```javascript
const functions = [
  {
    name: "get_mantis_issues",
    description: "Fetch issues from MantisBT with optional filters",
    parameters: {
      type: "object",
      properties: {
        status: {
          type: "string",
          enum: ["new", "assigned", "resolved", "closed"],
          description: "Filter by status"
        },
        priority: {
          type: "string",
          enum: ["low", "normal", "high", "urgent"],
          description: "Filter by priority"
        },
        assignee: {
          type: "string",
          description: "Filter by assigned user name"
        },
        limit: {
          type: "number",
          description: "Maximum number of results"
        }
      }
    }
  }
];
```

## Deployment Considerations

### Same Host Deployment

Since the chatbot will run on the same server as MantisBT:

**Network Configuration:**
- Use `http://localhost:8989` for API calls
- No need for CORS configuration
- Direct network access (fast)

**Docker Integration:**
- Can add chatbot service to `docker-compose.yml`
- Share same Docker network
- Use service name instead of localhost

**Example docker-compose addition:**
```yaml
chatbot:
  build: ./chatbot
  ports:
    - "3000:3000"
  environment:
    - MANTIS_API_TOKEN=${MANTIS_API_TOKEN}
    - OPENAI_API_KEY=${OPENAI_API_KEY}
    - MANTIS_BASE_URL=http://mantis/api/rest
  depends_on:
    - mantis
  networks:
    - mantis-network
```

### Environment Variables

**Required:**
```env
MANTIS_BASE_URL=http://localhost:8989/api/rest
MANTIS_API_TOKEN=your_api_token_here
OPENAI_API_KEY=your_openai_key_here
PORT=3000
```

**Optional:**
```env
NODE_ENV=production
LOG_LEVEL=info
CACHE_TTL=300
MAX_RESULTS=100
```

## Support and Resources

### Official Documentation

- [MantisBT REST API Documentation](https://mantisbt.org/docs/master/en-US/Developers_Guide/html/restapi.html)
- [MantisBT Admin Guide - API](https://mantisbt.org/docs/master/en-US/Admin_Guide/html/admin.config.api.html)
- [Postman Collection](https://documenter.getpostman.com/view/29959/mantis-bug-tracker-rest-api/7Lt6zkP)

### Local Resources

- MantisBT Installation: `/Users/chiligin/Desktop/Projects/mantisbt`
- Configuration: `config/config_inc.php`
- Docker Compose: `docker-compose.yml`
- Database: MariaDB on port 3306 (internal)

### Useful Commands

```bash
# Check if MantisBT is running
docker-compose ps

# View MantisBT logs
docker-compose logs -f mantis

# Access database
docker-compose exec db mariadb -u mantisbt -pmantisbt bugtracker

# Test API endpoint
curl -H "Authorization: YOUR_TOKEN" http://localhost:8989/api/rest/projects
```

## Next Steps for Chatbot Development

1. **Set up development environment**
   - Install Node.js/Python
   - Set up OpenAI API account
   - Generate MantisBT API token

2. **Build API client**
   - Implement authentication
   - Create wrapper functions for endpoints
   - Add error handling and retry logic

3. **Integrate ChatGPT**
   - Design system prompts
   - Implement function calling
   - Add context management

4. **Build frontend**
   - Create chat interface
   - Add response formatting
   - Implement history/session management

5. **Test thoroughly**
   - Unit tests for API client
   - Integration tests with MantisBT
   - User acceptance testing

6. **Deploy**
   - Configure production environment
   - Set up monitoring and logging
   - Document deployment process

---

**Document Version:** 1.0  
**Last Updated:** 2025-10-28  
**Maintainer:** Internal Development Team

