/* eslint-disable import/no-anonymous-default-export */
import BreadcrumbItem from "../models/common/breadcrum";

export type Page = {
    title: string;
    key: string;
    breadcrumb: BreadcrumbItem[];
}

export type PageMatcher = {
    pathMatch: string;
    exact: boolean;
    page: Page;
}

export const PAGES: PageMatcher[]=[
    {
        pathMatch: '/',
        exact: true,
        page:{
            title:'Home',
            key:'home',
            breadcrumb:[
                {title: 'Home'}
            ]
        }
    },
    {
        pathMatch: '/blogs',
        exact: false,
        page:{
            title:'Blogs',
            key:'blogs',
            breadcrumb:[
                {title: 'Blogs'}
            ]
        }
    },
    {
        pathMatch: '/blogs/blog1',
        exact: false,
        page:{
            title:'Blogs 1',
            key:'blog1',
            breadcrumb:[
                {title: 'Blogs 1'}
            ]
        }
    },
    {
        pathMatch: '/blogs/blog2',
        exact: false,
        page:{
            title:'Blogs 2',
            key:'blog2',
            breadcrumb:[
                {title: 'Blogs 2'}
            ]
        }
    },
    {
        pathMatch: '/contact',
        exact: false,
        page:{
            title:'Contact',
            key:'contact',
            breadcrumb:[
                {title: 'Contact'}
            ]
        }
    },
];

const resolvePage = (path: string): Page | undefined => {
    for (const matcher of PAGES) {
        if (matcher.exact && (matcher.pathMatch === path || matcher.pathMatch + "/" === path)) {
            return matcher.page;
        }
        if (!matcher.exact && path.startsWith(matcher.pathMatch)) {
            return matcher.page;
        }
    }
    return undefined;
}

export default {
    resolvePage: resolvePage
}