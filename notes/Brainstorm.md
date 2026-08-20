# Brainstorm Log — Melbourne Project

This file tracks ideas we considered along the way, including the ones we dropped, and why.

------------------------------------------------------------------------

## Original brainstorm - 11 Aug 2026: (Story of Places — no longer active)

### Framing the project

• Original brief asked 4 broad things: types of places, nature access, facility access, and relationships to property value/rent/business activity (and change over time).

### Unit of analysis

• Considered suburb level (rejected, too coarse) and address level (rejected, too granular). Decided on CLUE block level.

### Outcome variable

• Considered property value (rejected — not on CoM portal, would need external sourcing/geocoding), business activity (strong candidate, fully on portal), pedestrian counts/café seats (strong secondary candidates).

### Access to nature / facilities

• Decided to use tree canopy % + distance to nearest park for nature access; café seats and pedestrian counts as the core facility/activity measures.

### Method

• Decided on statistical clustering (k means/hierarchical) over manual place categorisation, to keep it objective and "analytics"-driven.

------------------------------------------------------------------------

## PIVOT — 16 Aug 2026: Story of Places changed to Pulse of Melbourne

**What's happening:** team is leaning toward moving from a spatial analysis of place types across Melbourne toward a time based analysis of activity rhythms across the city. Not fully locked in, still weighing it.

**Reasons being considered so far (not a final decision):**

• Teammate proposed the "Pulse of Melbourne" brief as a possible stronger direction.

• The City of Melbourne's Pedestrian Counting System (hourly data since 2009) looks like a strong fit for a "pulse" question because of high frequency, long history, multiple locations and possibly a more self contained data foundation than the places project, which needed several loosely related datasets stitched together. Worth validating this once we actually pull the data.

• Property value data, which was a known gap/risk in the places project (not available on the City of Melbourne portal), wouldn't be needed for this topic.

**What would carry over from the places work, if we do pivot:**

• Overall project management approach (Git repo, notes structure, meeting prep habits).

• CLUE/land use data could still support a bonus cross cut later if time allows.

• General instinct to break a broad brief into measurable sub questions before picking data, applied the same way to the new topic.

------------------------------------------------------------------------

## Pulse of Melbourne — new brainstorm

### Framing the project

• **Brief asks about**: rhythm (daily/weekly/monthly/seasonal), change over time, shifts after events (COVID, transport changes), weather response, and outlier days.

• Decided to treat this as fundamentally a time series problem, not a spatial one, main analysis is about time, with location as a secondary comparison dimension.

### Data backbone

• Considered building the whole project around several loosely connected datasets (like the places project). Decided against it because the Pedestrian Counting System alone is rich enough to carry most of the analysis, which lowers data integration risk significantly.

• Weather, public holidays, and COVID timeline identified as necessary *external* data to answer the "why" behind the patterns.

### Research question — still open

• Exploring a wide set of framing options nothing chosen yet.

• **One idea floated**: anchor the comparison at 2019 (last "clean" pre COVID year) as a baseline for measuring change.

• **Open question raised**: does a "since 2019" framing risk feeling dated by 2026, given COVID recovery is old news at this point? Possible middle ground discussed and keep 2019 as a statistical reference point but frame the question around the *current* state of the city's rhythm rather than a COVID recovery narrative. **Not agreed on as a team yet.**

### Scope trimming considered

• Full multi sensor, 15-year hourly panel with formal anomaly detection = too large for a course project.

• Decided to trim to: a handful of representative sensors (CBD core, retail strip, transport hub, riverside/leisure area), mostly daily level analysis (hourly only for a couple of illustrative charts), and 2 to 4 comparison years rather than the full 2009 to 2026 range.

### Whole team weighed in — 18 Aug 2026

• All three teammates independently brought their own research question ideas.

• Zhou proposed a titled three part structure rather than a single question: "The Rhythm of the City" (daily/weekly/seasonal + time & space), "Rain or Shine" (weather), and "Outlier Days and the Long View" (outliers and change over years and COVID/transport shocks). Liked this, the titles are presentation ready and the three parts cleanly split the whole brief without losing anything.

• Nishta contributed three more options, including an hourly typical day question and an other cities COVID recovery benchmark question. The benchmark idea is interesting but would need external data (other city foot traffic) not yet sourced, flagged as higher risk, not folded into the main synthesis for now.

• Richa contributed three single sentence options, the strongest being one that names time, space, change over time, and causal factors (seasonality, weather, holidays, events, disruptions) all in one question.

• **Drafted a possible way to combine everything**: use Richa's most complete question as the main research question, with Zhou's titled three part structure as report pillars underneath it, and slot Nishta's hourly/2019-baseline ideas in as sub analyses within those pillars.

• **This is a proposed synthesis only**, not yet agreed with the full team. Next step: bring this combined version back to everyone before treating anything as final.
