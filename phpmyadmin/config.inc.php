<?php
    /**
     * phpMyAdmin sample configuration, you can use it as base for
     * manual configuration. For easier setup you can use setup/
     *
     * All directives are explained in documentation in the doc/ folder
     * or at <https://docs.phpmyadmin.net/>.
     *
    * @package PhpMyAdmin
     */
    
    /**
     * This is needed for cookie based authentication to encrypt password in
     * cookie. Needs to be 32 chars long.
     */
    $cfg['blowfish_secret'] = '$2a$07$tSlS7XrPzpbUNkahFFGQkORN7jt6KwEuElg8soCxiI3q46h53kIFu'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */
    
    /**
     * Servers configuration
     */
    $i = 0;
    
    /**
     * First server
     */
    $i++;
    
    /* Authentication type */
    $cfg['Servers'][$i]['auth_type'] = 'cookie';
    
    /* Server parameters */
    $cfg['Servers'][$i]['host'] = 'mysql-service';
    $cfg['Servers'][$i]['port'] = '3306';
    $cfg['Servers'][$i]['user'] = 'wpuser';
    $cfg['Servers'][$i]['password'] = '123456789';
    $cfg['Servers'][$i]['compress'] = 'false';
    $cfg['Servers'][$i]['AllowNoPassword'] = 'false';
    
    /**
     * Directories for saving/loading files from server
     */
    $cfg['UploadDir'] = '';
    $cfg['SaveDir'] = '';