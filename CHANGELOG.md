# dbt-date v0.3.0

## Breaking Changes

* Switched `day_of_week` column in `get_date_dimension` from ISO to *not* ISO to align with the rest of the package. [#33](https://github.com/calogica/dbt-date/pull/33) (@davesgonechina)

## Features

* Added `day_of_week_iso` column to `get_date_dimension` [#33](https://github.com/calogica/dbt-date/pull/33) (@davesgonechina)

* Added `prior_year_iso_week_of_year` column to `get_date_dimension`

## Fixes

* Refactored Snowflake's `day_name` to not be ISO dependent [#33](https://github.com/calogica/dbt-date/pull/33) (@davesgonechina)

* Fixed data types for `day_of_*` attributes in Redshift ([#28](https://github.com/calogica/dbt-date/pull/28) by @sparcs)

* Fixed / added support for date parts other than `day` in `get_base_dates` ([#30](https://github.com/calogica/dbt-date/pull/30))

## Under the hood

* Making it easier to shim macros for other platforms ([#27](https://github.com/calogica/dbt-date/pull/27) by @swanderz)
