import { Router } from "express";
import { z } from "zod";

type Note = { id: string; title: string; content: string; createdAt: string; updatedAt: string };

const createNoteSchema = z.object({
  title: z.string().min(1),
  content: z.string().default("")
});

const router = Router();
const notes: Map<string, Note> = new Map();

router.get("/", (_req, res) => {
  res.json({ items: Array.from(notes.values()) });
});

router.post("/", (req, res) => {
  const parsed = createNoteSchema.safeParse(req.body);
  if (!parsed.success) {
    return res.status(400).json({ error: parsed.error.flatten() });
  }
  const id = crypto.randomUUID();
  const now = new Date().toISOString();
  const note: Note = { id, createdAt: now, updatedAt: now, ...parsed.data };
  notes.set(id, note);
  res.status(201).json(note);
});

router.get("/:id", (req, res) => {
  const note = notes.get(req.params.id);
  if (!note) return res.status(404).json({ error: "not_found" });
  res.json(note);
});

router.delete("/:id", (req, res) => {
  if (!notes.has(req.params.id)) return res.status(404).json({ error: "not_found" });
  notes.delete(req.params.id);
  res.status(204).send();
});

export default router;


