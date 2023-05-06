import React from 'react';

const Howto = () => {

    return (
        <>
            <section class="main-section HowTo-section">
                <div class="container">

                    <h1 className='HowTo'>HOW TO PLAY</h1>

                    <div class="Howto-details">
                        <div class="HowTo-video">
                            <div
        className="video"
        style={{
          position: "relative",
          paddingBottom: "56.25%" /* 16:9 */,
          paddingTop: 25,
          height: 0
        }}
      >
        <iframe
          style={{
            position: "absolute",
            top: 0,
            left: 0,
            width: "100%",
            height: "100%"
          }}
          src={`https://www.youtube.com/embed/wBgTn4GWDtQ`}
        />
      </div>
                            
                        </div>
                    
                        <div class="HowTo-description">
                            <div class="content">
                                <img width="200" src="/assest/navbarImg/logo_white.png"></img>
                                <h4 class="content-header">KID-DRAW-CLUB</h4>
                                <p class="content-text">
                                    The detail about this kid-draw-club. who are we and what can we do. et cetera.
                                    The detail about this kid-draw-club. who are we and what can we do. et cetera.
                                    The detail about this kid-draw-club. who are we and what can we do. et cetera.
                                </p>
                            </div>

                        </div>
                    </div>
                </div>
            </section>
        </>
    )
}
export default Howto