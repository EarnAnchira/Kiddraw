import React, { useEffect, useState } from "react";
import { Navbar, Nav, Container} from "react-bootstrap";
import NavbarCollapse from "react-bootstrap/esm/NavbarCollapse";

export const NavBarUser = () => {
    const [activeLink, setActiveLink] = useState('Home');
    const [scrolled,seScrolled] = useState(false);

    useEffect(() => {
        const onScroll = () => {
            if (window.scrollY > 50) {
                seScrolled(true);
            } else {
                seScrolled(false);
            }
        }

        window.addEventListener("scroll", onScroll);
        return () => window.removeEventListener("scroll",onScroll);
    },[])

    const onUpdateActiveLink = (value) => {
        setActiveLink(value);
    }

    return (
        <Navbar expand="lg" className={scrolled ? "scrolled": ""}>
            <Container>
                <Navbar.Brand href="/">
                    <img src="/logo_white.png" width="60" height="60" class="d-inline-block align-top" alt="logo"></img>
                </Navbar.Brand>
                <h6 style={{fontWeight:"200", paddingTop:"10px"}}>Welcome Back, @username</h6>
                <Navbar.Toggle aria-controls="basic-navbar-nav">
                    <span className="navbar-toggler-icon"></span>
                </Navbar.Toggle>
                <NavbarCollapse id="basic-navbar-nav">
                    <Nav className="ms-auto">
                        <Nav.Link href='/' className={activeLink === 'Home' ? 'active navbar-link' : 'navbar-link'} onClick={() => onUpdateActiveLink('Home')}>HOME</Nav.Link>
                        <Nav.Link href='/loginmember' className={activeLink === 'Home' ? 'active navbar-link' : 'navbar-link'} onClick={() => onUpdateActiveLink('Log In')}>LOG OUT</Nav.Link>
                    </Nav>
                </NavbarCollapse>
            </Container>

        </Navbar>
    )
}