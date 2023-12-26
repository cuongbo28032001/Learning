import React from 'react'
import {Outlet} from "react-router-dom";
import { Footer } from '../../components/footer/footer';
import Header from '../../components/header/header';
import PageSideBar from "./layout";
import "./layout.css";


export function PrimaryLayout() {
    return (
        <div className='div-layout'>
            <Header />
            <div className='div-contet-center'>
                <PageSideBar />
                <div className='div-outlet'><Outlet/></div>
            </div>
            <Footer />
        </div>
    );
}