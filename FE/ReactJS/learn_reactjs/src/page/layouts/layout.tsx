import React, { FC } from 'react';
import { Link, useLocation } from "react-router-dom";
import { Menu } from 'antd';
import { ItemType } from "antd/lib/menu/hooks/useItems";
import PagesConstant from "../../constants/pages.contant"

type Props = {};
// eslint-disable-next-line no-empty-pattern
const LayOut: FC<Props> = ({ }) => {
  const menuItems: ItemType[] = [
    {
      label: <Link to="/">Home</Link>,
      key: 'home'
    },
    {
      label: <Link to="/contact">Contact</Link>,
      key: 'contact'
    }
  ]

  const blogMenuItems = [];
  blogMenuItems.push({
    label: 'Blogs 1',
    key: 'blog1',
    icon: (
      <Link to={`/blogs/blog1`}>
      </Link>
    )
  });

  blogMenuItems.push({
    label: 'Blogs 2',
    key: 'blog2',
    icon: (
      <Link to={`/blogs/blog2`}>
      </Link>
    )
  });

  menuItems.push(
    {
      label: <>Blocs</>,
      key: 'blogs',
      children: blogMenuItems
    },
  );




  const location = useLocation();
  const page = PagesConstant.resolvePage(location.pathname);
  let selectedMenus: string[] = page?.key ? [page.key] : [];
  return (
    <div className='page-side-bar'>
      <div className='div-pagesidebar pull-top'>
        <Menu
          theme="light"
          defaultSelectedKeys={selectedMenus}
          selectedKeys={selectedMenus}
          mode="inline"
          items={menuItems}
          style={{ width: 99 }}
          inlineCollapsed
        />
      </div>
    </div>
  )
}


export default LayOut;
