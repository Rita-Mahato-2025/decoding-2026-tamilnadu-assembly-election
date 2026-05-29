<img src="https://github.com/rita-mahato-2025/decoding-2026-tamilnadu-assembly-election/raw/main/images/atliq_media_logo.png" width="200" alt="Logo">

# Decoding 2026 Tamil Nadu Assembly Election : End-to-End Analytics & Data Pipeline

## 🚀 Project Overview
This project is an end-to-end, full-stack data analytics solution analyzing the historic structural shift in the **2026 Tamil Nadu Legislative Assembly Election**. Moving away from basic, pre-packaged data reporting, this portfolio project manages the entire data lifecycle: programmatically scraping raw unstructured tables, running advanced data-cleaning pipelines in SQL, engineering a dimensional model, and building an interactive 3-page Business Intelligence application in Power BI.

Using the **STAR method (Situation, Task, Action, Result)**, this documentation outlines how the project systematically uncovers the "What", "How", and "Why" behind the massive political disruption caused by a new political entrant (**TVK**) that fractured the state's traditional bipolar political landscape.


### 🧩 Domain: Media & Politics
### Function: Data Analytics
### Difficulty: Advanced 

End-to-End Power Analytics Project 

**Live Dashboard:** [Click here](https://app.powerbi.com/view?r=eyJrIjoiNDBjOGYwNDctYmFiZC00ZDZlLTkwZDEtOTdhNGRjYjE2ZTBjIiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9)

---

## 📌 Table of Contents
- <a href="#overview">Project Overview</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#full-stack-architecture-and-data-pipeline">The Full Stack Architecture & Data Pipeline</a>
- <a href="#data-resource">Data Resource</a>
- <a href="#dataset-description">Dataset Description</a>
- <a href="#dimensional-model">Dimensional Model</a>
- <a href="#features-built">Features Built</a>
- <a href="#report-pages">Report Pages</a>
- <a href="#dashboard-preview">Dashboard Preview</a>
- <a href="#tech-stack-and-advanced-visualizations-implemented">Tech Stack & Advanced Visualizations Implemented</a>
- <a href="#key-analytical-pillars-and-insights">Key Analytical Pillars & Insights</a>
- <a href="#how-to-interact-with-this-project-locally">How to Interact with this Project Locally</a>
- <a href="#author--contact">Author & Contact</a>

---

## 🧾 Project Overview

AtliQ Media is a national news network making a one-hour TV show on the 2026 Tamil Nadu Assembly election results. Most channels will run heated debates and political commentary. AtliQ wants the opposite — a clean, simple, fact-based show that uses only public Election Commission of India (ECI) data.
AtliQ has hired you as a freelance data analyst. Your work will be the backbone of the show. The anchor will read from your slides. The on-screen graphics will come from your insights.
Your job: find the most interesting stories in the 2026 results, build clear charts for each story, and pitch them to AtliQ in a way that helps them plan the show.
You are not asked to explain why any party won or lost. You are not asked to predict what will happen next.
In 2026, AI can do most of the analysis for you. The real skill we are testing is storytelling: picking the right numbers, framing them so a regular viewer understands, and holding their attention without using complicated charts.

---
## Project Structure

```

tamilnadu-election-analysis-2026/
├── .gitignore               # Ignores large auto-generated recovery files
├── README.md                # The absolute focal point of your project
├── data/
│   ├── processed_voter_turnout.csv
│   └── regional_seat_matrix.csv
├── pbix/
│   └── TN_Election_2026_Analysis.pbix
└── visuals/
    ├── geographic_analysis.png
    ├── flip_story_sankey.png
    └── vote_share_trends.png
	
```
---
## 🛠️ The Full-Stack Architecture & Data Pipeline

```text
 [ Web Scraping ]              [ Data Engineering ]             [ Business Intelligence ]
   ECI Website     ┐
   IndiaVotes      ┴─► [ Python / Selenium ] ─► [ Raw CSVs ] ─► [ MySQL ]
                                                                       │
 [ Data Presentation ]                                                 ▼ (CTEs, JOINs, Windows)
   Interactive Power BI ◄────────────────────────────────────── [ Star Schema Models ]
   
 1. Data Scraping & Ingestion (Python & Selenium)
The Challenge: Election data on official portals like the Election Commission of India (ECI) and repository sites like IndiaVotes are heavily buried under nested drop-downs, dynamic JavaScript frames, and paginated tables that prevent simple HTTP requests.

The Action: Built robust automation scripts using Python and Selenium WebDriver to programmatically interact with DOM elements, select regional filters, handle dynamic table rendering, and extract granular constituency-level metrics.

The Ingestion: The parsed data was structured, audited for basic schema integrity using Pandas, and exported into raw, pipeline-ready .csv staging files.

2. Data Cleaning & Transformation (SQL)
The Challenge: Raw political datasets are notoriously messy—featuring mismatched constituency names, inconsistent party acronyms (e.g., ADMK vs. AIADMK), missing fields, and unformatted numeric strings for vote margins.

The Action: Loaded the staging files into a relational database and executed advanced transformation queries using SQL:

CTEs (Common Table Expressions): Implemented modular CTEs to isolate, clean, and compute relative year-over-year shifts without polluting the baseline data.

Relational JOINs: Executed deep multi-table inner and left JOINs to map geographic constituency IDs smoothly against candidate and party dimensions.

Data Standardization: Applied string manipulation functions and window operations to handle NULL values and align standardized party classification codes.

The Architecture: Structurally transformed the flat files into a highly optimized database Star Schema, consisting of centralized Fact tables flanked by clean, relational Dimension tables (Geography, Time, and Parties).

```
---
## 🧩 Data Resource

•	ECI Results Portal (2026 TN Assembly): results.eci.gov.in/ResultAcGenMay2026. Constituency-wise results, candidates, votes, and turnout for the 2026 election.
•	ECI Statistical Reports: eci.gov.in/statistical-reports. Official PDF reports with detailed statistics for past elections, including 2021 TN Assembly.
•	Chief Electoral Officer, Tamil Nadu: elections.tn.gov.in. State-level data, Form 20 polling-station-level data, and constituency master lists.
•	Open Government Data Platform: data.gov.in (ECI section). Downloadable election datasets in CSV and Excel formats.
•	IndiaVotes: indiavotes.com. An independent database of Indian election results. Good for quick cross-checks across years.
•	Census 2011 boundary data: censusindia.gov.in. Use only for map boundaries. Do not make any demographic claims about voters.
•	Codebasics starter pack: three CSV files — tn_2021_results.csv, tn_2026_results.csv, and constituency_master.csv. Same schema. Ready to use.

---
## 🧩 Dataset Description

### The project is based on 5 CSV files:

•	constituency_master.csv - holds data for constituency, district, region, reserved
•	indiavotes.csv - party, seats, vote%
•	political_parties_2026_clean.csv – party, candidates contested, candidates won, candidates fd, votes polled, valid votes, in seats contested
•	TamilNadu_2021_Detailed Results.csv – state name, constituency number, constituency name, candidate name, gender, age, category, party, symbol, general, postal, total, %votes polled, total electors
•	TamilNadu_2026_Detailed Results.csv – serial no., constituency number, constituency name, total electors, candidate name, gender, age, category, party, symbol, general votes, postal votes, total votes, percent valid votes, percent total electors

### Dimensional model:

•	dim_party_master → fact_election_result_enriched (1:many)
•	YearTable → fact_election_result_enriched (1:many)
•	dim_election → fact_election_result_enriched (1:many)
•	dim_constituency → fact_election_result_enriched (1:many)
•	dim_party_master → fact_election_result (1:many)
•	YearTable → fact_election_result (1:many)
•	dim_election → fact_election_result (1:many)
•	dim_constituency → fact_election_result (1:many)
•	mart_constituency_flips → fact_election_result (1:many)
•	mart_constituency_flips → dim_constituency (1:1, cross filter direction)

---

## 💡 Features Built (KPIs & Visuals)

## Key Metrics:

•	Seats Won 
•	Seats Won by DMK 2026
•	Seats Won by ADMK 2026
•	Seats Won by TVK 2026
•	Flipped Seats 
•	Flipped Seat %
•	% of Total (Seat Share %)

## Filters:

•	Election Year : 2021, 2026

---

## 🖥 Report Pages

### Geographic Story

•	Party-wise Seat Distribution Across Political Regions (Stacked Column Chart)
•	Seats Won by Region and Party Heatmap
•	Electoral Mandate 2026: Party Performance & Seat Distribution (Scatter Plot)

### Flip Story

•	Constituency Winner Transitions: 2021 vs 2026 (Sankey Diagram)
•	Constituency List (Table) - inter dependent with Sankey
•	Constituency Distribution by Political Region (Stacked Column Chart)

### Vote Share Story

•	Statewide Vote Share (100% Stacked Bar Chart)
•	Regional Vote Share (Stacked Column Chart) 
•	TVK Penetration (Stacked Bard Chart)
•	Vote Share Changed for Each Party (Matrix) - interdependent with TVK Penetration

---

### 📷 Dashboard Preview 

![Geographic Story](visuals/geographical_story_01.png)
![Geographic Story](visuals/geographical_story_02.png)

### 🔎 Key Analytical Insights 
``` 
•	The Urban Wave vs. Rural Resistance: TVK’s victory is built on an aggressive urban/semi-urban wave (evident from Chennai Metro and South regions). However, traditional parties still hold deep roots in specific pockets (AIADMK in North and Central).
•	Vote Splitting Dynamics: The "Electoral Mandate" scatter plots at the bottom right indicate that vote shares have dramatically shifted. The consolidation of a large vote chunk around the 36%–37% mark for TVK means the threshold to win seats became much tighter, resulting in multi-cornered fights where lower vote percentages yielded victories.
•	Coalition Imperative: Because TVK is at 108 seats, they need 10 more seats to form a government. They are highly likely to court smaller regional parties, independents, or potentially look at an alliance of convenience with fractured elements of the existing system to cross the line.
```
![Geographic Story](visuals/flip_story_01.png)
![Geographic Story](visuals/flip_story_02.png)
![Geographic Story](visuals/flip_story_03.png)

### 🔎 Key Analytical Insights 
``` 
•	TVK is Built on Disaffected DMK Voters: While TVK took seats from everyone, its primary engine of growth was consuming the DMK's 2021 urban coalition. For every 1 seat TVK took from ADMK, it took more than 2.5 seats from DMK.
•	The Core Stronghold Survival: Look closely at the background flows in image_02a319.png. Notice the thick, uninterrupted lines of voters staying with DMK and ADMK, alongside some minor flips (like INC or VCK voters moving around). This proves that while TVK completely disrupted the state, it did not entirely dissolve the core foundational party bases—it just disproportionately won the swinging, anti-incumbent majority.
```
![Geographic Story](visuals/vote_share_story.png)

### 🔎 Key Analytical Insights 
```
•	Efficiency of the Vote: TVK's 23.85% statewide vote share yielded 108 seats, meaning their vote was incredibly geographically efficient—especially in urban pockets like Chennai where their numbers spiked to 47%.
•	The Multi-Cornered Trap: With four major factions holding between 15% and 24% of the statewide vote (TVK, DMK, AIADMK, INC, and BJP), the threshold needed to win a constituency under the first-past-the-post system dropped significantly. This explains why a party with just ~34% regional vote share could trigger a massive seat sweep.
```
---
## 🛠 Tech Stack 

•	Python - Web Scrapping and Data Exploration
•	MySQL - Data Cleaning and Transformation
•	Power BI - Data Visualization

---

## 💡 Key Analytical Pillars & Insights

**Pillar 1: The Volatility Index (Tipping Point Analysis)**
This pillar measures the friction and stability of the electorate. Instead of just looking at who won, it quantifies the rate of rejection of sitting representatives.

**The Metric:** The **70.51% Flipped Seat %** (image_02a3d3.png).

**Insight:** A flip rate this high indicates systemic voter exhaustion with the status quo, rather than a standard, localized swing. When 7 out of 10 seats change hands, historical incumbency models become completely obsolete for predictive modeling.

**Pillar 2: Geographic Efficiency (The Concentration Advantage)**
This pillar analyzes the mathematical relationship between popular vote yield and regional seat acquisition. It answers how a party can maximize its return on investment (ROI) on votes.

**The Metric:** TVK's **47% Vote Share in Chennai Metro** yielding a **90%+ seat sweep** (image_029c18.png vs image_02a39b.png).

**Insight:** TVK achieved an incredibly high "Vote-to-Seat Conversion Ratio." By hyper-concentrating their resources into high-density urban corridors (Chennai Metro and the South) rather than spreading themselves thin statewide, they turned a modest 23.85% statewide popular vote into a dominant 108-seat plurality.

**Pillar 3: Cohort Cannibalization (Asymmetric Bleeding)**
This pillar maps out the exact donor-recipient pathways using flow metrics (Sankey data) to see which legacy brand's consumer base was stolen.

**The Metric: 65 seats** flipping **DMK → TVK** vs. **25 seats** flipping **ADMK → TVK** (image_02a39b.png & image_02a319.png).

**Insight:** The disruption was structurally asymmetric. TVK didn't pull equally from the duopoly; it acted as a direct substitute for the incumbent DMK. For every 1 seat TVK took from the opposition (ADMK), it cannibalized 2.6 seats from the ruling party (DMK), indicating that TVK successfully captured the anti-incumbent "change" cohort.

**Pillar 4: Vote-to-Seat Elasticity in Multi-Cornered Fractures**
This pillar evaluates the behavior of a fragmented political landscape under a First-Past-The-Post (FPTP) framework.

**The Metric:** Five political blocks pulling between **15% and 24%** of the statewide popular vote (image_029c18.png).

**Insight:** When the vote share drops into a tight, multi-cornered band, the "plurality threshold" required to win a seat drastically drops. In 2021, a candidate might have needed 45% of a local vote to win; in 2026, due to intense vote-splitting among DMK, AIADMK, BJP, and INC, TVK was able to win seats with a much lower mathematical floor (around 33%–35% in regions like Kongu and Delta).

**💡 Top 3 Data Insights for Your Presentation**
**📌 Insight 1: Urban Centers act as Political Early Adopters**
The data shows that the political disruption did not move uniformly. It started as an explosive wave in the urban capital (Chennai Metro: 47% vote share, 29 seats) and rippled outward into the semi-urban South (35% vote share). The deep rural segments (Central/North) acted as "laggards," showing massive resistance where legacy party machinery (like AIADMK's ground game) held flat at 15 seats.

**📌 Insight 2: The Fallacy of the Popular Vote**
If you only looked at the statewide popular vote change table (image_029c18.png), you would think DMK (−13.18%) and INC (−12.73%) suffered identical fates. However, cross-referencing this with seat charts reveals that DMK's vote remained tightly packed enough to salvage 61 seats, whereas the INC's vote was completely diluted, causing their seat efficiency to collapse.

**📌 Insight 3: The Coalition Imperative Matrix**
With TVK sitting at 108 seats (10 short of a majority) and the DMK-led block sitting fragmented, the dashboard maps the path to power. TVK does not need a mega-alliance; by targeting and converting just 10% of the minor, highly squeezed-out independent/ally blocks (like DMDK or others who saw minor seat/vote blips), they can form a highly stable coalition without compromising their core brand identity.

---

## 🛠️ Tech Stack & Advanced Visualizations Implemented
* **BI Platform:** Microsoft Power BI Desktop
* **Advanced Data Modeling:** Native Power BI Star Schema architecture with DAX measures for dynamic % of total seat distributions.
* **Sankey Flow Chart:** Implemented via advanced custom marketplace visuals to track asymmetric seat transitions.
* **Scatter Optimization Matrix:** Developed to map absolute Vote Share (%) against Seat Share (%) to gauge electoral efficiency.

---

## 📦 How to Interact with this Project Locally
1. Clone the repository: `git clone https://github.com/YOUR_USERNAME/tamilnadu-election-analysis-2026.git`
2. Open the `/pbix/TN_Election_2026_Analysis.pbix` file using Microsoft Power BI Desktop.
3. Use the contextual canvas buttons to fluidly cycle through the **Geographical Analysis**, **Flip Story**, and **Vote Share Story**.

---

## Author & Contact

**Rita Mahato**  

Data Analyst 

📧 Email: ds.rita.mahato@gmail.com  

🔗 [LinkedIn](https://www.linkedin.com/in/mahato-rita/)  
