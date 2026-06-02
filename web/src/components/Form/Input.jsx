export default function Input({ children, label, name, value, onChange, placeholder, type, ...props }) {

    return (
        <div>
            <label htmlFor="email"
                className="">
            {label}
            </label>
            <input type="text"
                name={name}
                value={value}
                onChange={onChange}
                placeholder={placeholder}
                className="bg-[#F9FEFF] h-12.5 w-full pl-2 py-3 pr-4 border-2 border-l-0 border-blue-700 focus:outline-none placeholder:text-blue-800 placeholder:text-[14px] placeholder:font-semibold active:bg-blue-50"
            />
        </div>
    )
}