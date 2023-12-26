import React from 'react';
import './App.css';
import {PrimaryLayout} from "./page/layouts/index";
import { BrowserRouter, Routes, Route} from "react-router-dom";
import Blogs from './page/blogs/blogs';
import Contact from './page/contact/contacts';
import UserInfo from './page/user_info/user_info';
import Home from './page/home/home';
// import Header from './components/header/header'
// import { Footer } from './components/footer/footer';
function App() {

    //React.createElement(type, props, children (có thể có nhiều children))

    //--------1 element---------
    // return  React.createElement('h1',{
    //   title:'Hello',
    //   className:'heading'
    // },'Hello guys!');

    //--------các element lồng nhau--------
    // return React.createElement('ul', {id: 'ul-id'}, React.createElement('li', null, React.createElement('a', {href: 'https://react.dev/'}, 'Link học ReactJS')), React.createElement('li', null, React.createElement('a', {href: 'https://react.dev/'}, 'Link học TypeScript')))

    //--------Cấu trúc sử dụng với các thẻ HTML----------

    // const value1 = "Link học ReactJS";
    // const value2 = "Link học TypeScript";

    // const courses = [
    //   {
    //     name: value1,
    //     llink: 'https://react.dev/'
    //   },
    //   {
    //     name: value2,
    //     llink: 'https://react.dev/'
    //   }
    // ];

    // return (
    //   <ul>
    //     {/* <li>
    //       <a href="https://react.dev/">Link học ReactJS</a>
    //     </li>
    //     <li style={{color: 'red'}}>
    //        <a href="https://react.dev/">Link học TypeScript</a>
    //     </li> */
    //     courses.map((item, index)=>(
    //       <li key={index}><a href={item.llink}>{item.name}</a></li>
    //     ))
    //     }
    //   </ul>
    // );

    //Sử dụng React.Fragment để bọc nhiều element
    // return (
    //   <React.Fragment>
    //     <Header />
    //     <h1>Heading 1</h1>
    //     <h2>Heading 2</h2>
    //     <Footer />
    //   </React.Fragment>
    // )

    return (
      <BrowserRouter>
        <Routes>
            <Route element = {<PrimaryLayout/>}>
              <Route index element={<Home />} />
              <Route path="/blogs/*" element={<Blogs />} />
              <Route path="/blogs/blog1/*" element={<></>} />
              <Route path="/blogs/blog2/*" element={<></>} />
              <Route path="/contact" element={<Contact />} />
              <Route path="*" element={<UserInfo />} />
            </Route>
        </Routes>
      </BrowserRouter>
    );

   
}

export default App;
