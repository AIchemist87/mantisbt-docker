<?php
$g_hostname               = 'db';
$g_db_type                = 'mysqli';
$g_database_name          = 'bugtracker';
$g_db_username            = 'mantisbt';
$g_db_password            = 'mantisbt';

$g_default_timezone       = 'Asia/Jerusalem';

$g_crypto_master_salt     = 'ymbjkb6QT48DnK4y78B/AeFxPZB1wV54pl0JNwP8MIU=';

$g_path                   = 'http://localhost:8989/';
$g_show_detailed_errors = OFF;
$g_display_errors = array(
    E_USER_ERROR => 'halt',
    E_RECOVERABLE_ERROR => 'halt',
    E_WARNING => 'inline',
    E_NOTICE => 'inline',
    E_USER_WARNING => 'inline',
    E_USER_NOTICE => 'inline'
);

$g_webmaster_email         = 'webmaster@example.invalid';
$g_from_email              = 'noreply@example.invalid';
$g_return_path_email       = 'bounce@example.invalid';
