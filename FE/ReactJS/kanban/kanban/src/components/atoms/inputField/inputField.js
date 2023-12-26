import style  from './inputField.module.css'


export default function Input(props){

    return(
        <>
            <form action="">
                <input type={props.type} value={props.value} onChange={props.performTask} className={style.input} />
            </form>
        </>
    )
}