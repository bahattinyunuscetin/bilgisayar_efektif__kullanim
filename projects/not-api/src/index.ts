import express from "express";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import notesRouter from "./routes/notes.js";

const app = express();

app.use(helmet());
app.use(cors());
app.use(express.json());
app.use(morgan("dev"));

app.get("/health", (_req, res) => {
  res.json({ status: "ok" });
});

app.use("/notes", notesRouter);

const port = Number(process.env.PORT || 3000);
app.listen(port, () => {
  // eslint-disable-next-line no-console
  console.log(`not-api listening on http://localhost:${port}`);
});


