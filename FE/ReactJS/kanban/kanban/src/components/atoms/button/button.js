import style from './button.module.css';


export default function Button(props){

    return(
        <>
        <div>
            <button className={style.btn} onClick={props.performTask} style={props.style} > {props.text}</button>
        </div>

        </>
    )
}