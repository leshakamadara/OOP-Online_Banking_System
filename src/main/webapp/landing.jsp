<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="css/globals.css" />
  <link rel="stylesheet" href="css/styleguide.css" />
  <link rel="stylesheet" href="css/styleLand.css" />

  <title>HelaBank</title>

  <style>
    /* Logo Carousel Styles */
    .partners-section {
      width: 100%;
      padding: 60px 0;
      position: relative;
      z-index: 1;
      overflow: hidden;
      background:transparent;
      backdrop-filter: blur(10px);
      margin: 40px 0;
    }
    
    .logo-carousel-container {
      width: 100%;
      overflow: hidden;
      position: relative;
      padding: 30px 0;
      border-top: none;
      border-bottom: none;
    }
    
    .logo-track {
      display: flex;
      animation: scroll 30s linear infinite;
      width: fit-content;
    }
    
    .logo-slide {
      min-width: 200px;
      height: 80px;
      margin: 0 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
    }
    
    .partner-logo {
      max-width: 160px;
      max-height: 60px;
      object-fit: contain;
      filter: grayscale(100%) brightness(2);
      opacity: 0.6;
      transition: all 0.3s ease;
    }
    
    .logo-slide:hover .partner-logo {
      filter: grayscale(0);
      opacity: 1;
      transform: scale(1.05);
    }
    
    .logo-slide:hover .partner-logo {
      filter: drop-shadow(0 0 8px rgba(43, 179, 42, 0.5));
    }
    
    @keyframes scroll {
      0% {
        transform: translateX(0);
      }
      100% {
        transform: translateX(-50%);
      }
    }
    
    /* Add responsive adjustments */
    @media (max-width: 768px) {
      .logo-slide {
        min-width: 160px;
        margin: 0 20px;
      }
      
      .partner-logo {
        max-width: 110px;
      }
    }
    
    @media (max-width: 480px) {
      .logo-slide {
        min-width: 120px;
        margin: 0 10px;
      }
      
      .partner-logo {
        max-width: 80px;
      }
    }
    </style>

</head>
<body>
  <div class="greenbank-landing">
    <div class="overlap-wrapper">
      <div class="overlap">
        <!-- Background dora elements -->
        <div class="bg">
          <div class="dora-wrap">
            <div class="overlap-group">
              <div class="dora-1"></div>
              <div class="dora-2"></div>
              <div class="dora-3"></div>
              <div class="dora-4"></div>
              <div class="dora-5"></div>
            </div>
          </div>
        </div>
        
        <!-- Navbar -->
        <nav class="navbar">
          <a href="landing.jsp" class="logo-container">
            <img src="images/unnamed.png" alt="HelaBank Logo" class="logo-image">
            <div class="logo-text">HelaBank</div>
          </a>
          <ul class="menu">
            <li class="item" id="item1"><a href="landing.html">Home</a></li>
            <li class="item" id="item2"><a href="#">Personal</a></li>
            <li class="item" id="item3"><a href="#">Buisness</a></li>
            <li class="item" id="item4"><a href="#">Corporate</a></li>
            <li class="item" id="item5"><a href="#">Crads</a></li>
            <li class="item" id="item6"><a href="#">Digital Banking</a></li>
          </ul>
          <button class="login-btn" id="login-btn">Login</button>
        </nav>
        
        <!-- Content Container -->
        <div class="content-container">
          <!-- Hero Section -->
          <section class="hero-section">
            <div class="hero-content">
              <h1>Discover the Perfect Banking Service!</h1>
              <p>Discover the power of our secure and rewarding banking. Explore our range of banking services and take control of your finances today.</p>
              <button class="get-started-btn">
                Get Started
                <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M8 0L6.59 1.41L12.17 7H0V9H12.17L6.59 14.59L8 16L16 8L8 0Z" fill="currentColor"/>
                </svg>
              </button>
            </div>
            <div class="hero-image">
              <div class="credit-card-container">
                <img src="images/unnamed.png" alt="HelaBank Credit Card" class="credit-card">
                <div class="green-circle"></div>
              </div>
            </div>
          </section>

          <!-- Stats Section -->
          <section class="stats-section">
            <div class="stats-container">
              <div class="stat-item">
                <h2>16Y</h2>
                <p>Experience</p>
              </div>
              
              <div class="stat-item">
                <h2>250<span>+</span></h2>
                <p>Merchant Partner</p>
              </div>
              
              <div class="stat-item">
                <h2>18<span>+</span></h2>
                <p>Years Experience</p>
              </div>
              
              <div class="stat-item">
                <h2>10.2k<span>+</span></h2>
                <p>Islandwide Clients</p>
              </div>
            </div>
          </section>

          <!-- Partners Logo Carousel Section -->
<section class="partners-section">
  <div class="section-heading">
    <h2>Our Trusted Partners</h2>
  </div>
  
  <div class="logo-carousel-container">
    <div class="logo-track">
      <!-- First set of logos -->
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Upwork Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Petal Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Rakuten Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="New York Times Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Vice Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Dell Logo" class="partner-logo">
      </div>
      
      <!-- Duplicate logos for seamless scrolling -->
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Upwork Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Petal Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Rakuten Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="New York Times Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Vice Logo" class="partner-logo">
      </div>
      <div class="logo-slide">
        <img src="images/unnamed.png" alt="Dell Logo" class="partner-logo">
      </div>
    </div>
  </div>
</section>


          <!-- Services Section -->
          <section class="services-section">
            <div class="section-heading">
              <h2>What Do We Offer</h2>
            </div>
            
            <div class="services-container">
              <!-- Service 1 -->
              <div class="service-card">
                <div class="service-icon">
                  <img src="images/unnamed.png" alt="Credit Card Icon" class="service-img">
                </div>
                <h3>Credit Cards</h3>
                <p>Explore our range of credit cards designed to fit your lifestyle with competitive rates, rewards, and exclusive benefits.</p>
              </div>
              
              <!-- Service 2 -->
              <div class="service-card">
                <div class="service-icon">
                  <img src="images/unnamed.png" alt="Financial Advice Icon" class="service-img">
                </div>
                <h3>Financial Advice</h3>
                <p>Get personalized financial guidance from our expert advisors to help you make informed decisions and achieve your goals.</p>
              </div>
              
              <!-- Service 3 -->
              <div class="service-card">
                <div class="service-icon">
                  <img src="images/unnamed.png" alt="Savings Icon" class="service-img">
                </div>
                <h3>Savings Plans</h3>
                <p>Build your wealth with our flexible savings plans that offer competitive interest rates and help you reach your financial milestones.</p>
              </div>
            </div>
          </section>

          <!-- Design Card Section -->
          <section class="design-card-section">
            <div class="design-card-container">
              <div class="design-card-content">
                <h2>Design your personalized credit card.</h2>
                <p>You have the freedom to personalize the design of your credit card, ensuring a truly unique experience that makes you feel extraordinary.</p>
                <button class="create-card-btn">
                  Create New Card
                  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8 0L6.59 1.41L12.17 7H0V9H12.17L6.59 14.59L8 16L16 8L8 0Z" fill="currentColor"/>
                  </svg>
                </button>
              </div>
              
              <div class="card-stack-image">
                <img src="images/unnamed.png" alt="Personalized Credit Cards Stack" class="stacked-cards">
              </div>
            </div>
          </section>

          <section class="design-card-section">
            <div class="design-card-container">
              <div class="design-card-content">
                <h2>Design your personalized credit card.</h2>
                <p>You have the freedom to personalize the design of your credit card, ensuring a truly unique experience that makes you feel extraordinary.</p>
                <button class="create-card-btn">
                  Create New Card
                  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8 0L6.59 1.41L12.17 7H0V9H12.17L6.59 14.59L8 16L16 8L8 0Z" fill="currentColor"/>
                  </svg>
                </button>
              </div>
              
              <div class="card-stack-image">
                <img src="images/unnamed.png" alt="Personalized Credit Cards Stack" class="stacked-cards">
              </div>
            </div>
          </section>

          <section class="design-card-section">
            <div class="design-card-container">
              <div class="design-card-content">
                <h2>Design your personalized credit card.</h2>
                <p>You have the freedom to personalize the design of your credit card, ensuring a truly unique experience that makes you feel extraordinary.</p>
                <button class="create-card-btn">
                  Create New Card
                  <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8 0L6.59 1.41L12.17 7H0V9H12.17L6.59 14.59L8 16L16 8L8 0Z" fill="currentColor"/>
                  </svg>
                </button>
              </div>
              
              <div class="card-stack-image">
                <img src="images/unnamed.png" alt="Personalized Credit Cards Stack" class="stacked-cards">
              </div>
            </div>
          </section>

          <!-- Benefits Section (New) -->
          <section class="benefits-section">
            <div class="section-heading">
              <h2>Card Benefits</h2>
              <p>Enjoy premium benefits with our credit cards</p>
            </div>
            
            <div class="benefits-container">
              <div class="benefit-card">
                <div class="benefit-icon">
                  <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z" fill="#2bb32a"/>
                  </svg>
                </div>
                <h3>Reward Points</h3>
                <p>Earn points on every purchase and redeem them for travel, merchandise, or statement credits.</p>
              </div>
              
              <div class="benefit-card">
                <div class="benefit-icon">
                  <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 1L15.5 8.5H22L16.5 13L19 21L12 17L5 21L7.5 13L2 8.5H8.5L12 1Z" fill="#2bb32a"/>
                  </svg>
                </div>
                <h3>Travel Insurance</h3>
                <p>Get comprehensive coverage for trip cancellations, delays, and lost luggage while traveling.</p>
              </div>
              
              <div class="benefit-card">
                <div class="benefit-icon">
                  <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2ZM12 20C7.59 20 4 16.41 4 12C4 7.59 7.59 4 12 4C16.41 4 20 7.59 20 12C20 16.41 16.41 20 12 20ZM12.5 7H11V13L16.2 16.2L17 14.9L12.5 12.2V7Z" fill="#2bb32a"/>
                  </svg>
                </div>
                <h3>24/7 Support</h3>
                <p>Access dedicated customer service anytime, anywhere with our premium support team.</p>
              </div>
              
              <div class="benefit-card">
                <div class="benefit-icon">
                  <svg width="32" height="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2ZM13 17H11V15H13V17ZM13 13H11V7H13V13Z" fill="#2bb32a"/>
                  </svg>
                </div>
                <h3>Purchase Protection</h3>
                <p>Shop with confidence knowing your purchases are protected against damage or theft.</p>
              </div>
            </div>
          </section>

          <!-- Testimonials Section (New) -->
          <section class="testimonials-section">
            <div class="section-heading">
              <h2>What Our Clients Say</h2>
            </div>
            
            <div class="testimonials-container">
              <div class="testimonial-card">
                <div class="testimonial-rating">
                  <span class="star">★</span>
                  <span class="star">★</span>
                  <span class="star">★</span>
                  <span class="star">★</span>
                  <span class="star">★</span>
                </div>
                <p class="testimonial-text">"The personalized card design feature is amazing! I get compliments on my unique card everywhere I go. The rewards program is also one of the best I've experienced."</p>
                <div class="testimonial-author">
                  <div class="author-avatar"></div>
                  <div class="author-info">
                    <h4>Sarah Johnson</h4>
                    <p>Premium Card Member</p>
                  </div>
                </div>
              </div>
              
              <div class="testimonial-card">
                <div class="testimonial-rating">
                  <span class="star">★</span>
                  <span class="star">★</span>
                  <span class="star">★</span>
                  <span class="star">★</span>
                  <span class="star">★</span>
                </div>
                <p class="testimonial-text">"HelaBank's customer service is exceptional. I had an issue while traveling abroad and they resolved it within minutes. Their 24/7 support is truly reliable."</p>
                <div class="testimonial-author">
                  <div class="author-avatar"></div>
                  <div class="author-info">
                    <h4>Michael Chen</h4>
                    <p>Business Card Member</p>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <!-- Footer -->
          <footer class="footer-section">
            <div class="footer-container">
              <div class="footer-logo">
                <a href="index.html" class="logo-container">
                  <img src="images/unnamed.png" alt="HelaBank Logo" class="logo-image">
                  <div class="logo-text">HelaBank</div>
                </a>
              </div>
              
              <div class="footer-links">
                <div class="footer-column">
                  <h3>Company</h3>
                  <ul>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Careers</a></li>
                    <li><a href="#">Press</a></li>
                  </ul>
                </div>
                
                <div class="footer-column">
                  <h3>Products</h3>
                  <ul>
                    <li><a href="#">Credit Cards</a></li>
                    <li><a href="#">Savings</a></li>
                    <li><a href="#">Investments</a></li>
                  </ul>
                </div>
                
                <div class="footer-column">
                  <h3>Support</h3>
                  <ul>
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Contact Us</a></li>
                    <li><a href="#">FAQs</a></li>
                  </ul>
                </div>
                
                <div class="footer-column">
                  <h3>Legal</h3>
                  <ul>
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                    <li><a href="#">Cookies</a></li>
                  </ul>
                </div>
              </div>
            </div>
            
            <div class="footer-bottom">
              <p>&copy; 2025 HelaBank. All rights reserved.</p>
              <div class="social-icons">
                <a href="#" class="social-icon">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18 2H15C13.6739 2 12.4021 2.52678 11.4645 3.46447C10.5268 4.40215 10 5.67392 10 7V10H7V14H10V22H14V14H17L18 10H14V7C14 6.73478 14.1054 6.48043 14.2929 6.29289C14.4804 6.10536 14.7348 6 15 6H18V2Z" fill="white"/>
                  </svg>
                </a>
                <a href="#" class="social-icon">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M23 3.00005C22.0424 3.67552 20.9821 4.19216 19.86 4.53005C19.2577 3.83756 18.4573 3.34674 17.567 3.12397C16.6767 2.90121 15.7395 2.95724 14.8821 3.2845C14.0247 3.61176 13.2884 4.19445 12.773 4.95376C12.2575 5.71308 11.9877 6.61238 12 7.53005V8.53005C10.2426 8.57561 8.50127 8.18586 6.93101 7.39549C5.36074 6.60513 4.01032 5.43868 3 4.00005C3 4.00005 -1 13 8 17C5.94053 18.398 3.48716 19.099 1 19C10 24 21 19 21 7.50005C20.9991 7.2215 20.9723 6.94364 20.92 6.67005C21.9406 5.66354 22.6608 4.39276 23 3.00005Z" fill="white"/>
                  </svg>
                </a>
                <a href="#" class="social-icon">
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C14.717 2 15.056 2.01 16.122 2.06C17.187 2.11 17.912 2.277 18.55 2.525C19.21 2.779 19.766 3.123 20.322 3.678C20.8305 4.1779 21.224 4.78259 21.475 5.45C21.722 6.087 21.89 6.813 21.94 7.878C21.987 8.944 22 9.283 22 12C22 14.717 21.99 15.056 21.94 16.122C21.89 17.187 21.722 17.912 21.475 18.55C21.2247 19.2178 20.8311 19.8226 20.322 20.322C19.822 20.8303 19.2173 21.2238 18.55 21.475C17.913 21.722 17.187 21.89 16.122 21.94C15.056 21.987 14.717 22 12 22C9.283 22 8.944 21.99 7.878 21.94C6.813 21.89 6.088 21.722 5.45 21.475C4.78233 21.2245 4.17753 20.8309 3.678 20.322C3.16941 19.8222 2.77593 19.2175 2.525 18.55C2.277 17.913 2.11 17.187 2.06 16.122C2.013 15.056 2 14.717 2 12C2 9.283 2.01 8.944 2.06 7.878C2.11 6.812 2.277 6.088 2.525 5.45C2.77524 4.78218 3.1688 4.17732 3.678 3.678C4.17767 3.16923 4.78243 2.77573 5.45 2.525C6.088 2.277 6.812 2.11 7.878 2.06C8.944 2.013 9.283 2 12 2ZM12 7C10.6739 7 9.40215 7.52678 8.46447 8.46447C7.52678 9.40215 7 10.6739 7 12C7 13.3261 7.52678 14.5979 8.46447 15.5355C9.40215 16.4732 10.6739 17 12 17C13.3261 17 14.5979 16.4732 15.5355 15.5355C16.4732 14.5979 17 13.3261 17 12C17 10.6739 16.4732 9.40215 15.5355 8.46447C14.5979 7.52678 13.3261 7 12 7ZM18.5 6.75C18.5 6.41848 18.3683 6.10054 18.1339 5.86612C17.8995 5.6317 17.5815 5.5 17.25 5.5C16.9185 5.5 16.6005 5.6317 16.3661 5.86612C16.1317 6.10054 16 6.41848 16 6.75C16 7.08152 16.1317 7.39946 16.3661 7.63388C16.6005 7.8683 16.9185 8 17.25 8C17.5815 8 17.8995 7.8683 18.1339 7.63388C18.3683 7.39946 18.5 7.08152 18.5 6.75ZM12 9C12.7956 9 13.5587 9.31607 14.1213 9.87868C14.6839 10.4413 15 11.2044 15 12C15 12.7956 14.6839 13.5587 14.1213 14.1213C13.5587 14.6839 12.7956 15 12 15C11.2044 15 10.4413 14.6839 9.87868 14.1213C9.31607 13.5587 9 12.7956 9 12C9 11.2044 9.31607 10.4413 9.87868 9.87868C10.4413 9.31607 11.2044 9 12 9Z" fill="white"/>
                  </svg>
                </a>
              </div>
            </div>
          </footer>
        </div>
      </div>
    </div>
  </div>

  <script>

    document.addEventListener('DOMContentLoaded', function() {
  
  const statElements = document.querySelectorAll('.stat-item h2');
  
  // For each stat element
  statElements.forEach(element => {

    const originalText = element.innerHTML;
    

    let targetNumber = parseInt(originalText.replace(/[^\d]/g, ''));
    

    let currentNumber = 0;
    

    const extraContent = originalText.replace(/[\d]/g, '');
    
    // Set up the counter function
    function updateCounter() {
      // Increase the current number
      currentNumber += Math.ceil(targetNumber / 100);
      
      // If we've reached or exceeded the target, stop counting
      if (currentNumber >= targetNumber) {
        currentNumber = targetNumber;
        clearInterval(counterInterval);
      }
      
      // Update the display
      element.innerHTML = currentNumber + extraContent;
    }
    
 
    element.innerHTML = '0' + extraContent;
    
 
    const counterInterval = setInterval(updateCounter, 50);
  });
});





//Logo scroll js
document.addEventListener('DOMContentLoaded', function() {
 
  const logoTrack = document.querySelector('.logo-track');
  logoTrack.innerHTML = '';
  
  
  function addSingleLogo(imgSrc, altText) {
    const newSlide = document.createElement('div');
    newSlide.className = 'logo-slide';
    const newLogo = document.createElement('img');
    newLogo.src = imgSrc;
    newLogo.alt = altText;
    newLogo.className = 'partner-logo';
    newSlide.appendChild(newLogo);
    logoTrack.appendChild(newSlide);
  }
  
  
  addSingleLogo('images/dialog.jpg', 'Dialog');
  addSingleLogo('images/images-17.png', 'Partner Logo');
  addSingleLogo('images/images-18.png', 'Partner Logo');
  addSingleLogo('images/images-19.png', 'Partner Logo');
  addSingleLogo('images/malib.png', 'Malib');
  addSingleLogo('images/pickme.png', 'PickMe');
  addSingleLogo('images/sliit.png', 'SLIIT');
  addSingleLogo('images/thilakawardhana_cover.jpeg', 'Thilakawardhana');
  addSingleLogo('images/unnamed.png', 'Partner Logo');
  
  // Duplicate the entire set for infinite scrolling
  const allSlides = logoTrack.innerHTML;
  logoTrack.innerHTML += allSlides;
  
  // Update animation duration
  const totalSlides = document.querySelectorAll('.logo-slide').length;
  const newDuration = totalSlides * 2.5;
  logoTrack.style.animationDuration = `${newDuration}s`;
  
  console.log('Logos added!');
});



    // Add New button redirection
    document.getElementById('login-btn').addEventListener('click', function() {
        window.location.href = 'Login.jsp';
    });
    
    // Quick Actions redirection
    document.querySelectorAll('.action-icon').forEach(function(item, index) {
        item.addEventListener('click', function() {
            switch(index) {
                case 0: window.location.href = 'create-account.jsp'; break;
                case 1: window.location.href = 'newLoan.jsp'; break;
                case 2: window.location.href = 'mobileCash.jsp'; break;
                case 3: window.location.href = 'stopCheque.jsp'; break;
                case 4: window.location.href = 'slipless.jsp'; break;
            }
        });
    });
    
    // Send | Pay button redirection
    document.querySelector('.middle-button').addEventListener('click', function() {
        window.location.href = 'sendPay.jsp';
    });
    </script>

</body>
</html>