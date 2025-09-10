/**
 * ProductManager Pro - Auth JavaScript
 * Gestion des interactions pour les pages d'authentification
 */

(function() {
    'use strict';

    // Configuration
    const CONFIG = {
        fadeDelay: 300,
        submitDelay: 1500,
        passwordMinLength: 6
    };

    // Éléments DOM
    const elements = {
        loginForm: document.getElementById('loginForm'),
        loginBtn: document.getElementById('loginBtn'),
        togglePassword: document.getElementById('togglePassword'),
        passwordInput: document.getElementById('password'),
        usernameInput: document.getElementById('username'),
        rememberMe: document.getElementById('rememberMe'),
        alerts: document.querySelectorAll('.alert')
    };

    /**
     * Initialisation de l'application
     */
    function init() {
        // Attendre que le DOM soit complètement chargé
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', setupEventListeners);
        } else {
            setupEventListeners();
        }
    }

    /**
     * Configuration des écouteurs d'événements
     */
    function setupEventListeners() {
        // Gestionnaire du formulaire de connexion
        if (elements.loginForm) {
            elements.loginForm.addEventListener('submit', handleFormSubmit);
        }

        // Basculer la visibilité du mot de passe
        if (elements.togglePassword) {
            elements.togglePassword.addEventListener('click', togglePasswordVisibility);
        }

        // Validation en temps réel
        if (elements.usernameInput) {
            elements.usernameInput.addEventListener('input', validateUsername);
            elements.usernameInput.addEventListener('blur', validateUsername);
        }

        if (elements.passwordInput) {
            elements.passwordInput.addEventListener('input', validatePassword);
            elements.passwordInput.addEventListener('keypress', handlePasswordKeypress);
        }

        // Gestion du "Remember Me"
        if (elements.rememberMe) {
            loadRememberedCredentials();
            elements.rememberMe.addEventListener('change', handleRememberMe);
        }

        // Auto-dismiss des alertes
        dismissAlertsAutomatically();

        // Focus automatique
        setInitialFocus();

        // Animations d'entrée
        animatePageEntry();
    }

    /**
     * Gestionnaire de soumission du formulaire
     */
    function handleFormSubmit(e) {
        e.preventDefault();

        const username = elements.usernameInput.value.trim();
        const password = elements.passwordInput.value;

        // Validation finale
        if (!validateForm(username, password)) {
            return;
        }

        // Affichage du loading
        showLoadingState();

        // Sauvegarde des préférences
        if (elements.rememberMe.checked) {
            saveCredentials(username);
        } else {
            clearSavedCredentials();
        }

        // Simulation d'un délai pour l'effet visuel
        setTimeout(() => {
            elements.loginForm.submit();
        }, CONFIG.submitDelay);
    }

    /**
     * Basculer la visibilité du mot de passe
     */
    function togglePasswordVisibility() {
        const passwordField = elements.passwordInput;
        const toggleIcon = elements.togglePassword.querySelector('i');

        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleIcon.classList.remove('fa-eye');
        }