import { createSlice } from '@reduxjs/toolkit';

const taskSlice = createSlice({
name:'tasks',
initialState:{
  listData:[],

},
reducers:{
  setListData:(state,action)=>{
    state.listData = action.payload
  },

}
})

export const { setListData} = taskSlice.actions;
  

export default taskSlice.reducer;
