# Circular-to-Action Converter
AI-powered campus utility that converts college circulars into personalized action plans. Extracts deadlines, documents, and eligibility criteria; tracks tasks and checklists; detects revised notices and conflicting information; and offers calendar exports, reminders, and AI assistance to help students complete college requirements on time.

## Intelligent, Personalized Campus Notice Management System
**Theme:** Intelligent Web Apps – Campus Utility

---

### 1. Executive Summary & Product Vision

Colleges distribute notices through dense PDFs, scanned images, websites, and forwarded messages. Students frequently miss critical deadlines or misinterpret requirements because notices are lengthy, contain multiple mixed instructions, or apply only to particular branches, years, or quotas.

**Circular-to-Action Converter** is a production-grade full-stack web application that transforms unstructured college circulars into **clear, personalized, verifiable, and trackable action plans**.

It answers the essential student questions:
- *What do I need to do?*
- *Does this notice apply to me?*
- *When is the deadline and what happens if I miss it?*
- *Where must I go or submit documents?*
- *What should I bring?*
- *Has the college changed the original instructions in a revised circular?*

---

### 2. Four Signature Innovations

#### 🎯 1. Personalized Applicability Engine
- Compares circular conditions against student profile attributes (Course, Academic Year, Department, Quota/Category, CGPA).
- Produces explainable outcomes:
  - `Applies to you` (e.g. *"Applies because notice explicitly targets 3rd Year B.Tech Computer Science"*).
  - `Does not apply` (e.g. *"Notice targets 2nd Year BCA students"*).
  - `Potentially applies` (e.g. *"Course and Year match, but requires income verification < 2.5 LPA"*).
  - `Needs verification` (e.g. *"Unspecified branch cutoff"*).
- Updating your student profile automatically recalculates applicability across all notices.

#### 🔍 2. Proof-Linked Extraction & Split-Screen Viewer
- Every extracted deadline, location, document requirement, and penalty is strictly linked to supporting source sentences and page numbers.
- **Side-by-Side Split View**: Clicking any proof citation pill highlights and scrolls to the exact evidence in the original document viewer.
- **Field-Level Correction & Audit Log**: Allows students or staff to correct extracted facts, storing the revision reason and timestamp in an audit log without mutating the original text.

#### 🔄 3. Circular Version & Change Detection
- Associates revised notices (Version 2+) with prior circulars.
- Computes semantic diffs:
  - Extended deadlines (e.g., 8th November extended to 18th November).
  - Altered fees and penalty amounts (e.g., late fine revised from Rs. 500 to Rs. 750).
- Pinpoints affected action items and alerts students before modifying task deadlines.

#### ⚠️ 4. Contradiction & Ambiguity Detection
- Detects conflicting dates, vague eligibility rules, or unreadable clauses within the same notice.
- Flags notices with `Conflict Flagged` and `Review Required` rather than fabricating an arbitrary date or guessing.

---

### 3. Additional Key Features

- **Multi-Step Dependency Engine**: Converts complex administrative workflows into ordered prerequisites (e.g., *Step 1: Pay exam fee online* ➔ *Step 2: Collect stamped hall ticket at Room 104*). Dependent tasks stay blocked until prerequisites are satisfied.
- **Prioritization & Deadline Risk**: Explainable priority risk scoring (`Urgent`, `Due Soon`, `Upcoming`, `At Risk`, `Blocked`, `Overdue`, `Completed`).
- **Preparation Checklists**: Interactive checkboxes for gathering income certificates, getting HOD signatures, and submitting forms.
- **RFC-5545 `.ics` Calendar Export**: Instant downloadable calendar stream compatible with Google Calendar, Apple Calendar, and Outlook.
- **Grounded Circular AI Assistant**: Answers circular-specific questions with citations and multilingual explanations (Simple English, Kannada, Hindi), with built-in prompt-injection safeguards.
- **One-Click Demo Seeder**: Generates realistic sample college circulars covering scholarships, exam revisions, and conflicting notices.

---

### 4. Technology Stack

- **Backend**: Python 3.11, FastAPI, Pydantic v2, SQLAlchemy 2 (Async), aiosqlite / PostgreSQL, PyPDF / PyMuPDF, iCalendar, python-jose, bcrypt, pytest.
- **Frontend**: React 19, TypeScript, Vite, Tailwind CSS v4, Lucide Icons, React Router v7.
- **Deployment**: Docker, Docker Compose, Nginx.

---

### 5. Running the Application Locally

#### Prerequisites
- Node.js (v18+) and npm
- Python (3.11+) or `uv` package manager

#### A. Backend Setup
```bash
cd backend

# Create virtual environment & install dependencies
python -m venv .venv
# On Windows:
.venv\Scripts\activate
# On Linux/macOS:
source .venv/bin/activate

pip install -r requirements.txt greenlet email-validator pytz

# Start FastAPI server on port 8000
uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
```
API Documentation will be live at: **http://127.0.0.1:8000/docs**

#### B. Frontend Setup
```bash
cd frontend

# Install packages
npm install

# Start Vite dev server on port 5173
npm run dev
```
Web application will be live at: **http://localhost:5173**

---

### 6. Running with Docker Compose

To run both backend and frontend in containers:
```bash
docker-compose up --build
```
- Frontend: `http://localhost:5173`
- Backend API: `http://localhost:8000`

---

### 7. Automated Testing Suite

To run the backend test suite:
```bash
cd backend
pytest -v
```
**Test Coverage Includes:**
1. `test_health_check`: API health and uptime verification.
2. `test_auth_workflow_and_profile`: User registration, JWT issuance, profile updates.
3. `test_circular_extraction_and_applicability`: Text ingestion, multi-action parsing, proof citations, student profile matching.
4. `test_contradiction_detection`: Detection of conflicting dates without hallucinating facts.
5. `test_version_diff_detection`: Comparison of original vs revised notices, deadline extensions, fee modifications.
6. `test_task_management_checklists_and_dependencies`: Checklist toggling, status transitions, and dependency unblocking.
7. `test_action_verification_and_audit`: Field-level correction, verification status updates, audit history.
8. `test_calendar_export_ics`: RFC-5545 compliant `.ics` calendar generation with valid timezones and UIDs.
9. `test_circular_chat`: Grounded question-answering with citations and prompt-injection safeguards.

---

### 8. Quick Start / Demo Workflow

1. Navigate to `http://localhost:5173`.
2. Click **Get Started** or **Sign In**.
3. Click the **Autofill Demo** button to populate student credentials (`arjun.sharma@campus.edu`).
4. Click **Load Demo Notices** in the navbar to populate realistic sample circulars:
   - *State Post-Matric Merit-cum-Means Scholarship* (Multi-step with dependencies)
   - *Semester End Examination V1 & V2 Revised* (Version diff with deadline extension)
   - *Mandatory Lab Safety Clearance* (Conflicting dates flagged for review)
5. Explore the interactive **Split-Screen Source Viewer** by clicking any notice in the inbox.
6. Click any **Proof Citation** chip to see the exact sentence highlighted on the original notice page.
7. Click **Export .ICS Calendar** on the Calendar page to import deadlines directly into your calendar.
