import React, { useState } from "react";
import AddOutlinedIcon from "@mui/icons-material/AddOutlined";
import Styles from './list.module.css'
import { setListData } from '../../../store/slices/taskSlices'
import CloseIcon from "@mui/icons-material/Close";
import uuid from "react-uuid";
import { useDispatch, useSelector } from "react-redux";

const List = () => {
    const [listName, setListName] = useState("");
    const [isBtn, setIsBtn] = useState(true);

    const dispatch = useDispatch();
    const listData = useSelector((state) => state.tasks.listData)

    function handleClick() {
        setIsBtn(!isBtn);
    }

    function handleAddList() {
        let Lname = listName.trim();
        if (Lname !== "") {
            let Id = uuid();

            const listObj = {
                id: Id,
                listName: listName,
                task: [],
            };

            setListName("");
            dispatch(setListData([...listData, listObj]));
            localStorage.setItem('List', JSON.stringify([...listData, listObj]));
        }
    }

    return (
        <div className={Styles.Main}>
            {isBtn ? (
                <div>
                    <button onClick={handleClick} className={Styles.btn}>
                        <AddOutlinedIcon /> Add a List{" "}
                    </button>
                </div>
            ) : (
                <div className={Styles.Toggled}>
                    <input
                        value={listName}
                        onChange={(e) => setListName(e.target.value)}
                        type="text"
                        placeholder="Enter List name "
                    />
                    <div className={Styles.buttonclose}>
                        <button onClick={handleAddList}>Add List</button>
                        <CloseIcon onClick={handleClick} />
                    </div>
                </div>
            )}
        </div>

    );
};

export default List;