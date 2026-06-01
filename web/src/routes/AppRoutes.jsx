import { createBrowserRouter } from "react-router";
import { RouterProvider } from "react-router/dom";

import App from "../App";
import Home from "../pages/Home";
import Login from "../pages/Login";
import CaesRegister from "../pages/CaesRegister"
import CatRegister from "../pages/CatRegister"
import Cadastros from "../pages/Cadastros";
import Castrados from "../pages/Castrados";
import Espera from "../pages/Espera";
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
                    { index: true, Component: Dashboard},
                    { path:"caes", Component: CaesRegister},
                    { path:"gatos", Component: CatRegister},
                    { path:"cadastro", Component: Cadastros},
                    { path:"castrados", Component: Castrados},
                    { path:"filaespera", Component: Espera},
                    { path: "about", Component: About },
                ]
            },

        ],
        errorElement: <Error />
    }
])