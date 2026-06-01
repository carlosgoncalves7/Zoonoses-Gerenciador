import { NavLink } from "react-router"

export default function Link({children, href,svg, ...props}) {

    const linkStyle = {
        default: "px-4 py-3 rounded-lg bg-blue-50 border border-blue-600  text-blue-700 transition-all",
        active: "px-4 py-3 rounded-lg bg-blue-700 border border-blue-600  text-blue-50 transition-all font-bold"
    }

    const boxStyle = {
        default: "flex flex-row items-center justify-items-start gap-2"
    }

    return (
        <NavLink to={href}
            className={({ isActive }) => isActive ? linkStyle.active : linkStyle.default}>
            <div className={boxStyle.default}>
                {svg ? svg : ''}
                <span className="text-base">{children}</span>
            </div>
        </NavLink>
    )
}