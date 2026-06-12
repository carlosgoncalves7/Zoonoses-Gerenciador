import { NavLink } from "react-router"

export default function Link({ children, href, svg, className, ...props }) {

    const linkStyle = {
        default: "px-4 py-3 rounded-lg bg-blue-50 border border-blue-600  text-blue-700 transition-all",
        active: "px-4 py-3 rounded-lg bg-blue-700 border border-blue-600  text-blue-50 transition-all font-bold"
    }

    // box-shadow: 0 -3px 9.7px 0 rgba(0, 172, 204, 0.14) inset, 
    // -4px 4px 10px 0 rgba(0, 0, 0, 0.04), 
    // 4px 0 10px 0 rgba(0, 0, 0, 0.04), 
    // 0 -4px 10px 0 rgba(0, 0, 0, 0.04), 
    // 0 4px 10px 0 rgba(0, 0, 0, 0.04);
    const link = {
        default: `h-12.5 px-4 py-3 rounded-lg text-blue-50 border border-transparent font-bold transition-all hover:bg-blue-700/50
                
                hover:shadow-[-4px_4px_10px_0_rgba(0, 0, 0, 0.02)]
                hover:shadow-[4px_0_10px_0_rgba(0, 0, 0, 0.02)]
                hover:shadow-[0_-4px_10px_0_rgba(0, 0, 0, 0.02)]
                hover:shadow-[0_4px_10px_0_rgba(0, 0, 0, 0.02)]`,

        active: `h-12.5 px-4 py-3 text-blue-50 rounded-lg bg-blue-700 border border-blue-600 font-bold transition-all 
                inset-shadow-blue
                shadow-[-4px_4px_10px_0_rgba(0, 0, 0, 0.04)]
                shadow-[4px_0_10px_0_rgba(0, 0, 0, 0.04)]
                shadow-[0_-4px_10px_0_rgba(0, 0, 0, 0.04)]
                shadow-[0_4px_10px_0_rgba(0, 0, 0, 0.04)]`
    }

    const boxStyle = {
        default: "flex flex-row items-center justify-items-start gap-2 "
    }

    // box-shadow: 
    // 0 -3px 9.7px 0 rgba(0, 172, 204, 0.14) inset, 
    // -4px 4px 10px 0 rgba(0, 0, 0, 0.04), 
    // 4px 0 10px 0 rgba(0, 0, 0, 0.04), 
    // 0 -4px 10px 0 rgba(0, 0, 0, 0.04), 
    // 0 4px 10px 0 rgba(0, 0, 0, 0.04);



    return (
        <NavLink to={href}
            className={({ isActive }) => isActive ? link.active : link.default}>
            <div className={boxStyle.default}>
                {svg ? svg : ''}
                <span className="text-base">{children}</span>
            </div>
        </NavLink>
    )
}