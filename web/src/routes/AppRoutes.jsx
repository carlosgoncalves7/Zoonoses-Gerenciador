import { createBrowserRouter } from "react-router";
import { RouterProvider } from "react-router/dom";

import App from "../App";
import Home from "../pages/Home";
import AuthLayout from "../pages/AuthLayout";
import Login from "../components/Login"
import Register from "../components/Register"

import Dashboard from "../pages/Dashboard";
import About from "../pages/About";
import Error from "../pages/Error";

export const router = createBrowserRouter([
    {
        path: "/",
        Component: App,
        children: [
            { index: true, Component: Login },
            {
                path: "home", Component: Home,
                children: [
                    { index: true, path: "dashboard", Component: Dashboard },
                    { path: "about", Component: About },
                    { path: "register", Component: Register }
                ]
            },

        ],
        errorElement: <Error />
    }
])