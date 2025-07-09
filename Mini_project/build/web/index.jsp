<jsp:include page="header.jsp" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chelsea+Market&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Homemade+Apple&display=swap" rel="stylesheet">

<style>
  .main_section {
    display: flex;
    height: calc(100vh - 70px); /* Adjust based on your header height */
    width: 100%;
   font-family: "Chelsea Market", system-ui;
  }

  .left_content {
    flex: 1;
    background-color: #fff6f0;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    padding: 60px;
    color: #333;
  }

  .left_content h1 {
    font-size: 4rem;
    margin-bottom: 20px;
    color: #ff8800;
  }

  .left_content h2 {
    font-family: 'Homemade Apple', cursive;
    font-size: 1.4rem;
    max-width: 600px;
    color: #555;
    line-height: 1.5;
  }

  .right_image {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #fff;
    overflow: hidden;
  }

  .right_image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 0;
  }

  @media (max-width: 768px) {
    .main_section {
      flex-direction: column;
    }

    .left_content, .right_image {
      width: 100%;
      height: 50vh;
      padding: 30px;
      text-align: center;
      align-items: center;
    }
    
    .left_content h1 {
      font-size: 2.5rem;
    }

    .left_content h2 {
      font-size: 1.2rem;
    }

    .right_image img {
      height: 100%;
      width: 100%;
      object-fit: cover;
    }
  }
  h4{
     font-family: "Chelsea Market", system-ui; 
  }
</style>

<div class="main_section">
  <div class="left_content">
    <h1>PAW CARE</h1>
    <h2>They may not speak our language, but they speak to our hearts.  
    Here, every paw, feather, and whisker is cared for with love.</h2>
    <p>Please Register/Login to Continue</p>
  </div>
  <div class="right_image">
    <img src="./images/main.jpg" alt="Pet Care Banner">
  </div>
</div>
