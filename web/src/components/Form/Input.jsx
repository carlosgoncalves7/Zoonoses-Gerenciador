export default function Input({ children, label, name, value, onChange, placeholder, type ="text", ...props }) {

    return (
        <div>
            <label htmlFor="email"
                className=" text-sm font-semibold text-blue-950 mb-2 block">
            {label}
            </label>
            <input type={type}
                name={name}
                value={value}
                onChange={onChange}
                placeholder={placeholder}
                className="bg-[#F9FEFF] h-12.5 w-full pl-2 py-3 pr-4 border-2 border-blue-700 rounded -lg focus:outline-none placeholder:text-blue-800 placeholder:text-[14px] placeholder:font-semibold active:bg-blue-50"
                required
            />
        </div>
    )
}