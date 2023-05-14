import { ReactP5Wrapper } from "react-p5-wrapper";
import * as ml5 from "ml5";
import React, { useState, useEffect } from 'react';
import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';
import Form from 'react-bootstrap/Form';
import ReactAudioPlayer from 'react-audio-player';
import { useParams, useNavigate } from "react-router-dom"
import Modal from "react-bootstrap/Modal";

const ImageComponent = () => {
    const { StoryID } = useParams("");
    const { UserName } = useParams("");
    const history = useNavigate();

    const [dataT, setDataT] = useState([]);
    const [dataD, setDataD] = useState([]);
    const [dataC, setDataC] = useState([]);

    const [AudioEng, setAudioEng] = useState(null);
    const [AudioThai, setAudioThai] = useState(null);

    const [AudioAnswerEng1, setAudioAnswerEng1] = useState(null);
    const [AudioAnswerEng2, setAudioAnswerEng2] = useState(null);

    const fetchAudioAnswerEng1 = async () => {
        const response = await fetch(`/audioanswereng1/${StoryID}`);
        const blob = await response.blob();
        setAudioAnswerEng1(blob);
    };

    const fetchAudioAnswerEng2 = async () => {
        const response = await fetch(`/audioanswereng2/${StoryID}`);
        const blob = await response.blob();
        setAudioAnswerEng2(blob);
    };

    const fetchAudioEng = async () => {
        const response = await fetch(`/audioeng/${StoryID}`);
        const blob = await response.blob();
        setAudioEng(blob);
    };

    const fetchAudioThai = async () => {
        const response = await fetch(`/audiothai/${StoryID}`);
        const blob = await response.blob();
        setAudioThai(blob);
    };

    const getDataTitle = async () => {
        const res = await fetch(`/poseanimatorT/${StoryID}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        });
        const data = await res.json();
        console.log(data);
        if (res.status === 422 || !data) {
            console.log("error ");
        } else {
            setDataT(data[0])
            console.log("get data");
        }
    }

    const getDataDetailetail = async () => {
        const res = await fetch(`/poseanimatorD/${StoryID}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        });
        const data = await res.json();
        console.log(data);
        if (res.status === 422 || !data) {
            console.log("error ");
        } else {
            setDataD(data[0])
            console.log("get data");
        }
    }

    const getDataCustom = async () => {
        const res = await fetch(`/poseanimatorCustom/${StoryID}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        });
        const data = await res.json();
        console.log(data);
        if (res.status === 422 || !data) {
            console.log("error ");
        } else {
            setDataC(data[0])
            console.log("get data");
        }
    }

    useEffect(() => {
        getDataTitle();
        getDataDetailetail();
        getDataCustom();
    }, []);

    function PostAnimator(poses) {
        let capture;
        let posenet;
        let singlePose, skeleton;
        let bgImage;
        let imgUpload, imgDrawing,imgDressingHead,imgDressingBody;

        poses.preload = function () {
            if (dataC.UploadImg != null) {
                imgUpload = poses.loadImage(`/uploads/${dataC.UploadImg}`);
            } else if (dataC.Drawing != null) {
                imgDrawing = poses.loadImage(`/${dataC.Drawing}`);
            }else if (dataC.DressingHead != null && dataC.DressingBody!= null ) {
                imgDressingHead = poses.loadImage(`/uploads/${dataC.DressingHead}`);
                imgDressingBody = poses.loadImage(`/uploads/${dataC.DressingBody}`);

            }
        };

        poses.setup = function () {
            capture = poses.createCapture(poses.VIDEO);
            // capture.hide();
            capture.style('transform', 'scaleX(-1)');
            capture.style('object-fit', 'cover');
            capture.style('width', '170px'); 
            capture.style('height', '170px');
            capture.style('clip-path', 'circle(50% at 50% 50%)');
            capture.style('position', 'relative');
            capture.style('margin', '0px -150px -80px 0px'); 
           
            poses.createCanvas(720, 400);
            posenet = ml5.poseNet(capture, modelLoaded);
            posenet.on('pose', receivedPoses);
            bgImage = poses.loadImage(`/uploads/${dataD.SceneImage}`);
        };

        function receivedPoses(poses) {
            // console.log(poses);
            if (poses.length > 0) {
                singlePose = poses[0].pose;
                skeleton = poses[0].skeleton;
            }
            // console.log(noseX + " " + noseY);
        }
        function modelLoaded() {
            // console.log('Model Loaded!');
        }

        poses.draw = function () {
            poses.background(bgImage);
            if (singlePose) {
                if (dataC.Drawing != null) {
                    poses.image(imgDrawing, singlePose.nose.x - 200, singlePose.nose.y - 150, 400, 400);
                } else if (dataC.UploadImg != null) {
                    poses.image(imgUpload, singlePose.nose.x - 200, singlePose.nose.y - 150, 400, 400);
                }else if (dataC.DressingHead != null && dataC.DressingBody != null)  {
                    poses.image(imgDressingBody, singlePose.nose.x - 200, singlePose.nose.y - 100, 400, 400);
                    poses.image(imgDressingHead, singlePose.nose.x - 200, singlePose.nose.y-150, 400, 400);
                }else {
                    console.log("error")
                }
            }
        };
    };

    // Select Answer
    const [isOpen, setIsOpen] = React.useState(false);
    const showModal = () => {
        if (dataD.PageType === "normal") {
            setIsOpen(false);
            // dataD.PageNo = (dataD.PageNo + 1)
            history(`/homeuser/${UserName}/${StoryID}/poseanimator/${dataD.PageNoNext}`)
        } else if (dataD.PageType === "alternative") {
            setIsOpen(true);
        }
    };
    const hideModal = () => {
        setIsOpen(false);
    };

    const PageAns1 = () =>{
        history(`/homeuser/${UserName}/${StoryID}/poseanimator/n2/${dataD.PageNoAnswer1Extra}/${dataD.PageNoAnswer1}/Ans1`)
        document.location.reload(false);
    }
    const PageAns2 = () =>{
        history(`/homeuser/${UserName}/${StoryID}/poseanimator/n2/${dataD.PageNoAnswer2Extra}/${dataD.PageNoAnswer2}/Ans2`)
        document.location.reload(false);
    }

    return (
        <>
        {/* Show select answer */}
                <Modal show={isOpen} onHide={hideModal} style={{ color: 'green' }}>
                    <Modal.Header>
                        <Modal.Title>
                            {dataD.QuestionEng}
                            <br />
                            {dataD.QuestionThai}
                        </Modal.Title>
                    </Modal.Header>

                    <Modal.Body>Please select an answer</Modal.Body>
                    <div className="d-flex justify-content-center">
                        <Button onClick={PageAns1} variant="warning" size="lg" style={{ marginRight: '5px' }}>{dataD.AnswerEng1}</Button>
                        <Button onClick={PageAns2} variant="info" size="lg" style={{ marginRight: '5px' }}>{dataD.AnswerEng2}</Button>
                    </div>
                    <Modal.Footer>
                        {/* audio answer */}
                        <div className="container mt-2">
                            <Button variant="outline-warning" style={{ marginRight: '5px' }} onClick={fetchAudioAnswerEng1}>Play audio</Button>
                            {AudioAnswerEng1 && <ReactAudioPlayer src={URL.createObjectURL(AudioAnswerEng1)} controls />}
                            <Button variant="outline-info" onClick={fetchAudioAnswerEng2}>Play audio</Button>
                            {AudioAnswerEng2 && <ReactAudioPlayer style={{ color: 'brown' }} src={URL.createObjectURL(AudioAnswerEng2)} controls />}
                        </div>
                        <Button variant="outline-danger" style={{ marginRight: '5px' }} onClick={hideModal}>Cancel</Button>
                    </Modal.Footer>
                </Modal>
                
                <section class="main-section topPage">
                    <div class="TitleLabel">
                        <div className="Th_txt">
                            {dataT.StoryTitleThai}
                        </div>
                        <div className="Eng_txt">
                           {dataT.StoryTitleEng} 
                        </div>
                    </div>
                </section>
                
                <div className="storySection">
                    <div className="BookSection">
                        <div class="BookPaper">
                            <div className="PicStory">
                                <ReactP5Wrapper sketch={PostAnimator}/>
                            </div>
                            
                            <div className="StoryAudio">
                                <button className="EngAudio" onClick={fetchAudioEng}>ENG</button>
                                {AudioEng && <ReactAudioPlayer src={URL.createObjectURL(AudioEng)} controls />}

                                <button className="ThAudio" onClick={fetchAudioThai}>TH</button>
                                {AudioThai && <ReactAudioPlayer src={URL.createObjectURL(AudioThai)} controls />}

                                AUDIO
                            </div>
                            
                            <div className="Storytxt">
                                <div className="Eng_txt"> 
                                    {dataD.StoryDetailEng}
                                </div>
                                <div className="Th_txt">
                                    {dataD.StoryDetailThai}
                                </div>
                            </div>

                            <button className="next_btn" onClick={showModal}> NEXT </button>
                        </div> 
                    </div>
                </div>
        </>
    )
};
export default ImageComponent