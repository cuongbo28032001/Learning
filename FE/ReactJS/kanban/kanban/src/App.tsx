import { Provider } from "react-redux";
import store from "./store/store";

import { BrowserRouter as Router,Route, Routes } from "react-router-dom";
import Board from "./components/pages/board/Board";
import CardInfo from "./components/organism/cardinfo/cardInfo";

function App() {
  return (
    <div className="App">
      <Provider store={store}>
        <Router>
          <Routes>
            <Route path="/" element={<Board />} />
            <Route path="/:Cid/:Lid/edit" element={<CardInfo />} />
          </Routes>
        </Router>
      </Provider>
    </div>
  );
}
export default App;
