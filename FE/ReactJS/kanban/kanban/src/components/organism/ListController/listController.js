import React, { useEffect, useState } from "react";
import DeleteIcon from "@mui/icons-material/Delete";
import Styles from "./listController.module.css";
import Card from "../card/card";
import { setListData } from "../../../store/slices/taskSlices";

import { useSelector, useDispatch } from "react-redux";
import { Droppable } from "react-beautiful-dnd";

const ListController = () => {
  const [inputVisible, setInputVisible] = useState(false);

  const dispatch = useDispatch();
  const listData = useSelector((state) => state.tasks.listData);

  useEffect(() => {
    const localStorageData = localStorage.getItem("List");
    if (localStorageData) {
      dispatch(setListData(JSON.parse(localStorageData)));
    }
    console.log(listData);
  }, []);

  function handleDelete(Id) {
    let input = [...listData];
    input = input.filter((ele) => ele.id !== Id);
    dispatch(setListData(input));
    localStorage.setItem("List", JSON.stringify(input));
  }

  function handleChange(e, Id) {
    let input = [...listData];
    let index = input.findIndex((ele) => ele.id === Id);
    let current = { ...input[index] };
    current.listName = e.target.value;
    input[index] = current;
    dispatch(setListData(input));
    localStorage.setItem("List", JSON.stringify(input));
  }

  return (
    <div style={{ display: "flex" }}>
      {listData.map((ele, index) => (
        <Droppable key={ele.id} index={index} droppableId={ele.id}>
          {(provided) => (
            <div
              className={Styles.mainCard}
              key={ele.id}
              ref={provided.innerRef}
              {...provided.droppableProps}
            >
              <div className={Styles.Upper}>
                {inputVisible ? (
                  <form onSubmit={() => setInputVisible(false)}>
                    <input
                      className={Styles.ListName}
                      type="text"
                      placeholder={ele.listName}
                      onChange={(e) => handleChange(e, ele.id)}
                    />
                    <DeleteIcon
                      onClick={() => handleDelete(ele.id)}
                      fontSize="small"
                    />
                  </form>
                ) : (
                  <p
                    style={{ width: "100%" }}
                    onClick={() => setInputVisible(true)}
                  >
                    <strong>{ele.listName}</strong>
                  </p>
                )}
              </div>
              <Card id={ele.id} Lname={ele.listName} task={ele.task} />
            </div>
          )}
        </Droppable>
      ))}
    </div>
  );
};

export default ListController;
