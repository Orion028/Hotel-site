<!--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>-->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
  <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
    <title>TajLake Homepage</title>
</head>
<body>
  <script src="home/javascript/TweenMax.min.js"></script>
    <header>
        <nav class="anav navbar-fixed-top">
          <img src="home/sass/logos/g7878.svg" id="logo">
          <ul  class="header-link">
              <li>
                  <a id="link1" href="Controller?action=loadhome" class="header-link__home" href="#">home</a>
                </li>
                <li>
                  <a  id="link3" href="#" class="header-link__gallery">gallery</a>
                </li>
                <li>
                  <a id="link5"  href="#" class="header-link__dining">dining</a>
                </li>
                <li>
                    <c:if test="${userLoggedIn == 1 }">
                      <a href="BookingController?action=roombooking" class="header__dining">booking</a>
                    </c:if>
                    <c:if test="${userLoggedIn == 0 }">
                      <a href="Controller?action=bookingwithoutLogin" class="header__dining">booking</a>
                    </c:if>
                </li>
                <li>
                  <c:if test="${ userLoggedIn != 1 }">
                       <a href="Controller?action=login" class="feader__signin">sign in</a>
                     </c:if>
                  
                </li>
                <li>
                  <c:if test="${ userLoggedIn == 1 }">
                       <a href="#" class="header__event" >"${username }" </a>
                     </c:if>
                     
                </li>
                 <li>
                  <c:if test="${ userLoggedIn == 1 }">
                       <a href="Controller?action=logoutFromHomepage" class="header__event" >  logout</a>
                  </c:if>
                     
                </li>
          </ul>
        </nav>
        
        <section class="videopart">
          <div class="hero">
              <video autoplay loop muted>
                  <source src="home/sass/video/soundremoved.mp4" type="video/mp4">
                  </video>
              <h1 class="headline">Taj Lake palace</h1>
          </div>
        </section>
      </header>

      <div class="slider"></div>
      <script>
        window.addEventListener('load', (event) => {

          TweenMax.to(".hero", 1, { height: "0vh" ,  height: "80vh", ease:Power2.easeInOut });
          TweenMax.to(".hero",1.2, {width: "100%", width:"80%",ease:Power2.easeInOut,delay:1 });
          TweenMax.to(".slider",2 , { x:"-100%", x:"0%", ease:Power2.easeInOut, delay:1});
          TweenMax.to(".hero",1.2, {x: "0", x:"20%",ease:Power2.easeInOut,delay:2 });
          TweenMax.to(".headline",1.2, {x: "-20%", x:"-60%",ease:Power2.easeInOut,delay:2 });
        })
</script>
<script>
  $(window).scroll(function()
    {
      if ($(document).scrollTop() > 100) {
        $('nav').addClass('navcolor');
      }
      else{
        $('nav').removeClass('navcolor');
      }
    }
  );
      </script> 
  <main>
      <div class="book-container" >
          <form action="BookingController" method="get" class="book">

              <input type="hidden" name="action" value="checkavailability">
            <div class="book-checkin">
              <p>Check in</p>
              <input type="date" name="checkin" value="${checkin }">
            </div>
            <div class="book-checkout">
              <p>check Out</p>
              <input type="date" name="checkout" value="${checkout }">
            </div>
            <div class="book-adult">
              <p>Adults</p>
              <input type="number" name="adults" placeholder="3" value="${adults }" min="1">
            </div>
            <div class="book-kids">
              <p>Kids</p>
              <input type="number" name="kids" placeholder="2" value="${kids }" min="0">
            </div>
           

            <!--
                	1 ROOMS AVAILABLE
                	0 ROOMS NOT AVAILABLE
                	-1 : IMPROPER DETAILS 
		            	-->
                <!-- My code -->
                
				 <div class="book-btn">
              <input type="submit"  class="btn" value="Check availability">
            	</div>
            	<c:if test="${checkroomsavailability == 1}" >
                	<h2><c:out value="${errormsg }"></c:out></h2>
                	<c:if test="${userLoggedIn == 1}">
                		<a href="BookingController?action=roombookingFromBookNow">BookNOW</a>
                	</c:if>
                	<c:if test="${userLoggedIn == 0}">
                		<a href="Controller?action=roombookingFromBookNowWithoutLogin">BookNOW</a>
                	</c:if>
                </c:if>
                <c:if test="${checkroomsavailability == 0}" >
                	<h2><c:out value="${errormsg }"></c:out></h2>
                </c:if>
                <c:if test="${checkroomsavailability == -1}" > 
                	<font color="red"><h2><c:out value="${errormsg }"></c:out></h2></font>
                </c:if>
        </form>
        </div>
    
    <div class="about u-margin-bottom-medium">
      <div class="about__inside">
        <h2 class="u-center-text about__heading">
          <span class="about__heading__head">about</span><br><br>
          <span class="about__heading__sub">The Lake Palace was built between 1743 and 1746 under the  direction of the Maharana Jagat Singh II (62nd successor to the royal dynasty of Mewar) of   Udaipur, Rajasthan as a summer palace. It was initially called Jagniwas or Jan Niwas after  its founder.

            The palace was constructed facing east, allowing its inhabitants to pray to Surya, the  Hindu sun god, at the crack of dawn.The successive rulers used this palace as their  summer resort, holding their regal durbars in its courtyards lined with columns,pillared terraces, fountains, and gardens.</span>
        </h2>  
      </div>
    </div>

    <div class="aboutroom u-margin-bottom-medium">
      <div class="aboutroom__container rellax" data-rellax-speed="-10">
      </div>
      <div class="aboutroom__inside">
        <h2 class="u-center-text aboutroom__inside__heading">
            <span class="aboutroom__inside__heading__head">our room</span><br><br>
            <span class="aboutroom__inside__heading__sub">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eligendi pariatur accusantium eveniet enim blanditiis iusto quae illum ullam perspiciatis! Vitae quaerat perspiciatis a itaque officiis sint aliquid eum illum ex?</span>
        </h2>
      </div>
    </div>

    <div class="service u-margin-bottom-medium">  
      <h2 class="service__heading u-center-text">services</span>
      </h2>
      <div class="column">
        <div class="section group">
            <div class="col span_1_of_3">
            <div class="for_m_l this__breakfast u-center-text">
              <img src="home/sass/logos/fast-food.svg" height="40px" width=auto>
              <h5 class="for_m this__breakfast">
                <span class="this__head">breakfast</span><br><br>
                <span class="this__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
              </h5>
              <div class="for_m_l this__wifi u-center-text">
                  <img src="home/sass/logos/wifi.svg" height="40px" width=auto>
                  <h5 class="for_m this__wifi">
                    <span class="this__head">free wifi</span><br><br>  
                    <span class="this__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                  </h5>
              </div>
            </div>
            </div>
            <div class="col span_1_of_3">
                <div class="for_m_l this__garden u-center-text">
                    <img src="home/sass/logos/park.svg" height="40px" width=auto>
                    <h5 class="for_m this__garden">
                      <span class="this__head">garden</span><br><br>  
                      <span class="this__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                    </h5>
                    <div class="for_m_l this__house-keep u-center-text">
                        <img src="home/sass/logos/cleaning.svg" height="40px" width=auto>
                        <h5 class="for_m this__house-keep">
                          <span class="this__head">housekeeping</span><br><br>  
                          <span class="this__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="col span_1_of_3">
                <div class="for_m_l this__pool u-center-text">
                    <img src="home/sass/logos/pool.svg" height="40px" width=auto>
                    <h5 class="for_m this__pool">
                      <span class="this__head">pool</span><br><br>  
                      <span class="this__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                    </h5>
                </div>
                <div class="for_m_l this__dine u-center-text">
                    <img src="home/sass/logos/dining.svg" height="40px" width=auto>
                    <h5 class="for_m this__pool">
                      <span class="this__head">in-room dining service</span><br><br>  
                      <span class="this__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                    </h5>
                </div>
            </div>
          </div>
          
          </div>
    </div>
    <div class="gall1">
    <h1 class="u-center-text gall1__heading u-margin-bottom-medium">
      <span class="gall1__heading__head">Gallery</span>
    </h1>
  </div>

    <div class="gallery u-margin-bottom-medium">
        <div class="image__box active">
          <img class="image__box__img" src="home/sass/pics/pic 1.jpg">
        </div>
        <div class="image__box">
            <img class="image__box__img" src="home/sass/pics/pic-2.jpg">
          </div>
          <div class="image__box">
              <img class="image__box__img" src="home/sass/pics/pic-3.jpg">
            </div>
            <div class="image__box">
                <img class="image__box__img" src="home/sass/pics/pic-4.jpg">
              </div>
    </div>

    <div class="things u-margin-bottom-medium">
        <h1 class="u-center-text heading u-margin-bottom-small">
            <span class="heading__head">Things to do</span>
        </h1>
        <!––idhar things to do he-->
        <div class="column1">
          <div class="section group">
              <div class="col span_1_of_3">
              <div class="this__activity u-center-text">
                <h5 class="this__activity">
                  <span class="this__activity__head">Wineries tour</span><br><br>  
                  <span class="this__activity__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                </h5>
                <div class="this__act2 u-center-text">
                    <h5 class="this__activity">
                      <span class="this__activity__head">cultural sites</span><br><br>  
                      <span class="this__activity__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                    </h5>
                </div>
              </div>
              </div>
              <div class="col span_1_of_3">
                  <div class="this__activity u-center-text">
                      <h5 class="this__activity">
                        <span class="this__activity__head">market tour</span><br><br>  
                        <span class="this__activity__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                      </h5>
                      <div class="this__activty u-center-text">
                          <h5 class="this__activty">
                            <span class="this__activity__head">leisure activities</span><br><br>  
                            <span class="this__activity__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                          </h5>
                      </div>
                  </div>
              </div>
              <div class="col span_1_of_3">
                  <div class="this__activity u-center-text">
                      <h5 class="this__activity">
                        <span class="this__activity__head">bird safari</span><br><br>  
                        <span class="this__activity__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                      </h5>
                  </div>
                  <div class="this__activity u-center-text">
                      <h5 class="this__activity">
                        <span class="this__activity__head">horse riding</span><br><br>  
                        <span class="this__activity__sub">Lorem ipsum dolor sit amet consectetur adipisicing elit.</span>
                      </h5>
                  </div>
              </div>
            </div>
            
            </div>
    </div>

    <div class="review u-margin-bottom-medium">
        <div class="review__container rellax" data-rell ax-speed="-10">
        </div>
        <div class="review__inside">
          <h2 class="u-center-text review__inside__heading">
              <span class="review__inside__heading__head">guest review</span><br><br>
              <span class="review__inside__heading__img">
                <img src="home/sass/logos/quote.svg" height="40" width="40"> 
              </span><br><br>
              <span class="review__inside__heading__sub">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae et nisi iure accusantium, sequi, distinctio velit corporis rem voluptatibus veniam vel eius mollitia asperiores earum aperiam delectus illo est harum. Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore dicta quam dolore nesciunt temporibus eligendi voluptates tempore rerum, tenetur expedita assumenda eos veniam facere adipisci cupiditate eius, sint reiciendis numquam.</span>
          </h2>
        </div>
    </div>

    <div class="contact u-margin-bottom-medium">
         <!––idhar our service aaega-->
         <div class="contant-heading u-center-text u-margin-bottom-medium">
           <p class="contact-heading__head">contact us</p><br>
           <p class="contact-heading__sub">info@mysite.com / a_adderess / phone_number</p>
         </div>
         <div class="contact-form">
           <form action="#" class="form">
             <div class="contact-form__login">
              <input type="text" class="contact-form__input" placeholder="Your name">
              <input type="email" class="contact-form__input" placeholder="Your email">
           </div>
           <div class="contact-form__subject">
              <input type="text" class="contact-form__input" placeholder="Subject">
            </div>
            <div class="contact-form__msg">
              <textarea class="contact-form__area" placeholder="Leave a Message"></textarea>
            </div>
            
            <div class="contact-form__btn">Send a Message</div>
           </form>
         </div>
         
    </div>

    <div class="map">
        <div id="map"></div>
        <script>

          var map, infoWindow;
          function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
              center: {lat: -34.397, lng: 150.644},
              zoom: 6
            });
            infoWindow = new google.maps.InfoWindow;
    
            // Try HTML5 geolocation.
            if (navigator.geolocation) {
              navigator.geolocation.getCurrentPosition(function(position) {
                var pos = {
                  lat: position.coords.latitude,
                  lng: position.coords.longitude
                };
    
                infoWindow.setPosition(pos);
                infoWindow.setContent('Location found.');
                infoWindow.open(map);
                map.setCenter(pos);
              }, function() {
                handleLocationError(true, infoWindow, map.getCenter());
              });
            } else {
              // Browser doesn't support Geolocation
              handleLocationError(false, infoWindow, map.getCenter());
            }
          }
    
          function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(browserHasGeolocation ?
                                  'Error: The Geolocation service failed.' :
                                  'Error: Your browser doesn\'t support geolocation.');
            infoWindow.open(map);
          }
        </script>
        <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB1lKN2mM02rokbHo6IxXGJpKvRIbX0Q0E&callback=initMap">
        </script>
    </div>



  </main>

</body>
<script src="home/javascript/rellax.min.js"></script>
    <script>
      var rellax = new Rellax('.rellax', {
        center: true
      });
      var rellaxNonCentered = new Rellax('.rellax-non-centered', {
        center: false
      });
    </script>
    <script src="home/javascript/scroll.js"></script>
</html>
