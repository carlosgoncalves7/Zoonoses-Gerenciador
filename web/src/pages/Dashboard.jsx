import { useState, useEffect } from "react";
import axios from "axios";

export const ViewsCard = ({ title, value, className, classSpan, ...props }) => {
    return (
        <div className={"bg-blue-900 flex flex-col justify-between px-5 py-4 rounded-[10px] hover:bg-blue-800 hover:cursor-pointer transition-colors" + " " + className}>
            <span className={"inline-block text-xl text-[#FFF] text-[18px] font-medium " + classSpan}>{title}</span>
            <p className="block text-[32px] text-[#FFF] font-bold text-end ">{value}</p>
        </div>
    )
}

export default function Dashboard() {
    const [animais, setAnimais] = useState(0)
    const [cao, setCao] = useState(0)
    const [gato, setGato] = useState(0)
    const [proc, setProc] = useState(0)
    const [anim, setAnim] = useState(0)

    const fetchData = async (funcao, url) => {
        try {
            const response = await axios.get(`http://localhost:8000/${url}`);
            const data = await response.data;
            if (!data) {
                funcao(false);
                return;
            }
            funcao(data[0].total)

        } catch (error) {
            console.error("Error fetching data:", error);
        }
    }
    useEffect(() => {
        fetchData(setCao, 'dogviews.php');
        fetchData(setGato, 'catviews.php');
        fetchData(setAnim, 'animaisviews.php');
        fetchData(setProc, 'procviews.php');
        fetchData(setCao, 'dogviews.php');

    }, [])

    return (
        <>
            <header className="flex flex-row justify-between items-center px-3 py-2 mb-3">
                <span className="text-[18px] text-blue-950 font-bold">Bem-Vindo ao Book</span>
            </header>
            <section>

                <div className="w-180 grid grid-cols-12 grid-rows-2 gap-6">

                    <ViewsCard
                        title={"Total de Cães cadastrados"}
                        value={cao}
                        className={"col-span-4"} />
                    <ViewsCard
                        title={"Total de Gatos cadastrados"}
                        value={gato}
                        className={"col-span-4"} />
                    <ViewsCard
                        title={"Total de animais cadastrados"}
                        value={anim}
                        className={"col-span-4"} />
                    <ViewsCard
                        classSpan="text-[14px]"
                        title={"Castrações realizadas"}
                        value={"N/A"}
                        className={"col-span-4"} />
                    <ViewsCard
                        title={"Procedimentos realizados"}
                        value={proc}
                        className={"col-span-8"} />

                </div>

            </section>
        </>
    )
}