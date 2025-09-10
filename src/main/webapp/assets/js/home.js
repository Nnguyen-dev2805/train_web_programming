// ProductManager Pro - Home Dashboard JavaScript

// DOM Elements
let starsContainer, particlesContainer, matrixContainer;
let isDarkTheme = false;

// Initialize everything when page loads
document.addEventListener('DOMContentLoaded', function() {
    initializeBackgroundEffects();
    initializeAnimations();
    initializeInteractions();
    showWelcomeToast();
    animateCounters();
    initializeTiltEffect();
});

// Background Effects
function initializeBackgroundEffects() {
    createStars();
    createParticles();
    createMatrix();
}

// Create animated stars
function createStars() {
    starsContainer = document.getElementById('stars');
    const numStars = 150;

    for (let i = 0; i < numStars; i++) {
        const star = document.createElement('div');
        star.className = 'star';
        star.style.left = Math.random() * 100 + '%';
        star.style.top = Math.random() * 100 + '%';
        star.style.animationDelay = Math.random() * 2 + 's';
        star.style.animationDuration = (Math.random() * 2 + 1) + 's';
        starsContainer.appendChild(star);
    }
}

// Create floating particles
function createParticles() {
    particlesContainer = document.getElementById('particles');
    const numParticles = 25;

    for (let i = 0; i < numParticles; i++) {
        const particle = document.createElement('div');
        particle.className = 'particle';
        particle.style.left = Math.random() * 100 + '%';
        particle.style.animationDuration = (Math.random() * 5 + 5) + 's';
        particle.style.animationDelay = Math.random() * 2 + 's';

        // Random colors for particles
        const colors = ['#00f0ff', '#bf00ff', '#39ff14', '#ffd93d'];
        const color = colors[Math.floor(Math.random() * colors.length)];
        particle.style.background = color;
        particle.style.boxShadow = `0 0 10px ${color}`;

        particlesContainer.appendChild(particle);
    }
}

// Create matrix rain effect
function createMatrix() {
    matrixContainer = document.getElementById('matrix');
    const characters = '01アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲンABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numColumns = Math.floor(window.innerWidth / 25);

    for (let i = 0; i < numColumns; i++) {
        const column = document.createElement('div');
        column.className = 'matrix-column';
        column.style.left = i * 25 + 'px';
        column.style.animationDuration = (Math.random() * 10 + 10) + 's';
        column.style.animationDelay = Math.random() * 5 + 's';

        let text = '';
        const columnHeight = Math.floor(Math.random() * 15) + 10;
        for (let j = 0; j < columnHeight; j++) {
            text += characters.charAt(Math.floor(Math.random() * characters.length)) + '<br>';
        }
        column.innerHTML = text;

        matrixContainer.appendChild(column);
    }
}

// Initialize animations
function initializeAnimations() {
    // Typing animation for welcome text
    const typingText = document.querySelector('.typing-text');
    if (typingText) {
        setTimeout(() => {
            typingText.style.borderRight = 'none';
        }, 4000);
    }

    // Add pulse animation to user avatar
    const userAvatar = document.querySelector('.user-avatar');
    if (userAvatar) {
        userAvatar.classList.add('pulse-animation');
    }
}

// Counter animation
function animateCounters() {
    const counters = document.querySelectorAll('.stat-number');

    counters.forEach(counter => {
        const target = parseInt(counter.getAttribute('data-target'));
        const duration = 2000; // 2 seconds
        const increment = target / (duration / 16); // 60fps
        let current = 0;

        const timer = setInterval(() => {
            current += increment;
            if (current >= target) {
                counter.textContent = target;
                clearInterval(timer);
            } else {
                counter.textContent = Math.floor(current);
            }
        }, 16);
    });
}

// Interactive features
function initializeInteractions() {
    // Add hover effects to cyber cards
    const cyberCards = document.querySelectorAll('.cyber-card');

    cyberCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            // Add glow effect
            this.style.boxShadow = '0 25px 50px rgba(0, 0, 0, 0.2), 0 0 40px rgba(0, 240, 255, 0.3)';

            // Play sound effect (if you want to add sound)
            playHoverSound();
        });

        card.addEventListener('mouseleave', function() {
            // Remove glow effect
            this.style.boxShadow = '';
        });

        // Add click ripple effect
        card.addEventListener('click', function(e) {
            const ripple = document.createElement('div');
            const rect = this.getBoundingClientRect();
            const size = 100;
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;

            ripple.style.cssText = `
                position: absolute;
                width: ${size}px;
                height: ${size}px;
                background: radial-gradient(circle, rgba(0, 240, 255, 0.6), transparent);
                border-radius: 50%;
                left: ${x}px;
                top: ${y}px;
                transform: scale(0);
                animation: rippleEffect 0.6s ease-out;
                pointer-events: none;
                z-index: 1000;
            `;

            this.appendChild(ripple);

            // Remove ripple after animation
            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });

    // Add CSS for ripple animation
    if (!document.querySelector('#ripple-styles')) {
        const style = document.createElement('style');
        style.id = 'ripple-styles';
        style.textContent = `
            @keyframes rippleEffect {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);
    }
}

// Tilt effect for cards
function initializeTiltEffect() {
    const tiltElements = document.querySelectorAll('[data-tilt]');

    tiltElements.forEach(element => {
        element.addEventListener('mousemove', function(e) {
            const rect = this.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            const centerX = rect.width / 2;
            const centerY = rect.height / 2;

            const rotateX = (y - centerY) / 10;
            const rotateY = (centerX - x) / 10;

            this.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.05, 1.05, 1.05)`;
        });

        element.addEventListener('mouseleave', function() {
            this.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) scale3d(1, 1, 1)';
        });
    });
}

// Theme toggle functionality
function toggleTheme() {
    isDarkTheme = !isDarkTheme;
    document.body.classList.toggle('dark-theme', isDarkTheme);

    const themeIcon = document.querySelector('.cyber-btn-sm i.fa-moon, .cyber-btn-sm i.fa-sun');
    if (themeIcon) {
        themeIcon.className = isDarkTheme ? 'fas fa-sun' : 'fas fa-moon';
    }

    // Save theme preference
    localStorage.setItem('darkTheme', isDarkTheme);

    // Show notification
    showNotification('Đã chuyển đổi giao diện thành công!', 'success');
}

// Notification system
function showNotifications() {
    const notifications = [
        { message: 'Có 2 sản phẩm mới được thêm vào hệ thống', type: 'info', time: '2 phút trước' },
        { message: 'Backup dữ liệu đã hoàn thành thành công', type: 'success', time: '15 phút trước' },
        { message: 'Cần cập nhật phiên bản mới của hệ thống', type: 'warning', time: '1 giờ trước' }
    ];

    // Create notification modal
    const modal = document.createElement('div');
    modal.className = 'notification-modal';
    modal.innerHTML = `
        <div class="notification-content">
            <div class="notification-header">
                <h4><i class="fas fa-bell"></i> Thông báo</h4>
                <button onclick="closeNotificationModal()" class="close-btn">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <div class="notification-list">
                ${notifications.map(notif => `
                    <div class="notification-item ${notif.type}">
                        <div class="notification-message">${notif.message}</div>
                        <div class="notification-time">${notif.time}</div>
                    </div>
                `).join('')}
            </div>
        </div>
    `;

    // Add modal styles
    modal.style.cssText = `
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.8);
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 10000;
        animation: fadeIn 0.3s ease;
    `;

    document.body.appendChild(modal);

    // Add event listener to close modal when clicking outside
    modal.addEventListener('click', function(e) {
        if (e.target === modal) {
            closeNotificationModal();
        }
    });
}

// Close notification modal
function closeNotificationModal() {
    const modal = document.querySelector('.notification-modal');
    if (modal) {
        modal.remove();
    }
}

// Show welcome toast
function showWelcomeToast() {
    const toast = document.getElementById('welcomeToast');
    if (toast) {
        const bsToast = new bootstrap.Toast(toast, {
            autohide: true,
            delay: 4000
        });

        setTimeout(() => {
            bsToast.show();
        }, 1000);
    }
}

// Utility function for notifications
function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `cyber-notification ${type}`;
    notification.innerHTML = `
        <div class="notification-content">
            <i class="fas fa-${type === 'success' ? 'check-circle' : type === 'warning' ? 'exclamation-triangle' : 'info-circle'}"></i>
            <span>${message}</span>
        </div>
    `;

    // Add notification styles
    notification.style.cssText = `
        position: fixed;
        top: 100px;
        right: 20px;
        background: var(--glass-bg);
        backdrop-filter: blur(25px);
        border: 1px solid var(--glass-border);
        border-radius: 15px;
        padding: 1rem 1.5rem;
        color: var(--text-light);
        z-index: 10000;
        animation: slideInRight 0.3s ease;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
    `;

    document.body.appendChild(notification);

    // Auto remove after 3 seconds
    setTimeout(() => {
        notification.style.animation = 'slideOutRight 0.3s ease forwards';
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}

// Confirmation dialog for logout
function confirmLogout() {
    const confirmed = confirm('Bạn có chắc chắn muốn đăng xuất khỏi hệ thống?');

    if (confirmed) {
        // Show loading notification
        showNotification('Đang đăng xuất...', 'info');

        // Simulate logout delay
        setTimeout(() => {
            showNotification('Đã đăng xuất thành công!', 'success');

            // Redirect after short delay
            setTimeout(() => {
                window.location.href = 'login';
            }, 1000);
        }, 1000);

        return false; // Prevent immediate redirect
    }

    return false;
}

// Sound effects (optional)
function playHoverSound() {
    // You can implement sound effects here if needed
    // Example: new Audio('path/to/hover-sound.mp3').play();
}

// Keyboard shortcuts
document.addEventListener('keydown', function(e) {
    // Ctrl + Shift + T for theme toggle
    if (e.ctrlKey && e.shiftKey && e.key === 'T') {
        toggleTheme();
        e.preventDefault();
    }

    // Ctrl + Shift + N for notifications
    if (e.ctrlKey && e.shiftKey && e.key === 'N') {
        showNotifications();
        e.preventDefault();
    }

    // Escape to close modals
    if (e.key === 'Escape') {
        closeNotificationModal();
    }
});

// Responsive adjustments
function handleResize() {
    // Recreate matrix on window resize
    if (matrixContainer) {
        matrixContainer.innerHTML = '';
        createMatrix();
    }

    // Adjust particles for mobile
    if (window.innerWidth < 768) {
        const particles = document.querySelectorAll('.particle');
        particles.forEach((particle, index) => {
            if (index > 10) {
                particle.style.display = 'none';
            }
        });
    } else {
        const particles = document.querySelectorAll('.particle');
        particles.forEach(particle => {
            particle.style.display = 'block';
        });
    }
}

// Add resize listener
window.addEventListener('resize', handleResize);

// Initialize theme from localStorage
const savedTheme = localStorage.getItem('darkTheme');
if (savedTheme === 'true') {
    toggleTheme();
}

// Add smooth scroll to anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Performance optimization: Intersection Observer for animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.animation = 'fadeInUp 0.6s ease forwards';
            observer.unobserve(entry.target);
        }
    });
}, observerOptions);

// Observe all cyber cards for scroll animations
document.querySelectorAll('.cyber-card').forEach(card => {
    observer.observe(card);
});

// Add loading screen fade out
window.addEventListener('load', function() {
    const loadingScreen = document.querySelector('.loading-screen');
    if (loadingScreen) {
        loadingScreen.style.opacity = '0';
        setTimeout(() => {
            loadingScreen.remove();
        }, 500);
    }
});

// Console welcome message
console.log(`
🚀 ProductManager Pro Dashboard Loaded Successfully!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 System Status: Online
🎨 Theme: Futuristic Cyber
💡 Features: Advanced Management System
⚡ Performance: Optimized
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Developer: ProductManager Pro Team
Version: 2.0.0
`);

// Export functions for global access
window.toggleTheme = toggleTheme;
window.showNotifications = showNotifications;
window.closeNotificationModal = closeNotificationModal;
window.confirmLogout = confirmLogout;