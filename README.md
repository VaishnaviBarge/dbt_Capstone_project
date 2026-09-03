# dbt Capstone Project

A comprehensive dbt (data build tool) project demonstrating modern data transformation practices and analytics engineering best practices using **dbt Cloud** and **Snowflake**.

## 📋 Project Overview

This capstone project showcases a professional-grade dbt implementation with a structured data transformation pipeline. It includes dimension tables, fact tables, source layer abstractions, and comprehensive testing and validation. The project is orchestrated through **dbt Cloud** and leverages **Snowflake** as the data warehouse.

## 🏗️ Project Structure

```
dbt_capstone_project/
├── models/                 # dbt models directory
│   ├── dim/               # Dimension tables (materialized as tables)
│   ├── fct/               # Fact tables (tagged as 'fact')
│   └── src/               # Source layer abstractions (ephemeral)
├── tests/                 # Data quality and validation tests
├── seeds/                 # Static reference data
├── analyses/              # Ad-hoc analysis queries
├── macros/                # Reusable dbt macros
├── snapshots/             # Type-2 slowly changing dimensions
├── assets/                # Project assets and documentation
├── dbt_project.yml        # Project configuration
└── packages.yml           # External package dependencies
```

## 🛠️ Tech Stack

- **Orchestration**: dbt Cloud
- **Data Warehouse**: Snowflake
- **Language**: Python (100%)

## 🔧 Project Configuration

- **Profile**: `dbt_capstone_project`
- **Target Path**: `target/` (compiled SQL files)
- **Version**: 1.0.0
- **Config Version**: 2

### Model Materialization Strategy

- **Dimension Models** (`dim/`): Materialized as **tables** for fast lookups
- **Fact Models** (`fct/`): Tagged as 'fact' for easy identification and monitoring
- **Source Models** (`src/`): Materialized as **ephemeral** for reference only
- **Other Models**: Default materialization as **views**

### Data Quality & Auditing

- Test failures are stored in a dedicated schema (`_test_failures`) for investigation
- Audit logging captures all model runs with timestamps in an `audit_log` table
- Grant-based access control for select models
- Post-hook auditing on all transformations

## 📦 Prerequisites & Setup

### Requirements

- dbt Cloud account (connected to your GitHub repository)
- Snowflake account with appropriate credentials
- Python >= 3.8 (for local development, if needed)

### Installation & Configuration

1. **Connect dbt Cloud to GitHub**
   - Authorize dbt Cloud to access this repository
   - dbt Cloud will automatically detect the dbt project

2. **Configure Snowflake Connection in dbt Cloud**
   - In dbt Cloud, set up a new project with Snowflake as the connection
   - Enter your Snowflake credentials:
     - Account URL
     - Username
     - Password (or API token)
     - Database name
     - Schema
     - Warehouse name
     - Role

3. **Set up dbt Cloud Jobs**
   - Create scheduling jobs for regular dbt runs
   - Configure notifications and alerts
   - Enable job logging and documentation generation

### Local Development Setup (Optional)

If running dbt locally:

```bash
# Install dbt with Snowflake adapter
pip install dbt-snowflake

# Install dbt dependencies
dbt deps

# Test your Snowflake connection
dbt debug

# Run your project
dbt build
```

## 🚀 Running dbt with dbt Cloud

### Via dbt Cloud UI

1. Navigate to your project in dbt Cloud
2. Click "Run" to trigger a job
3. Monitor run logs and test results in real-time
4. View generated documentation

### Via CLI (if using dbt from your machine)

```bash
# Install dependencies
dbt deps

# Run all models
dbt run

# Run and test with build
dbt build

# Run specific model
dbt run --select model_name

# Test data quality
dbt test

# Generate documentation
dbt docs generate

# Clean compiled artifacts
dbt clean
```

## 📊 Data Modeling Approach

This project follows the **Kimball dimensional modeling** methodology:

- **Dimensions** (`dim/`): Slowly changing dimensions with descriptive attributes
- **Facts** (`fct/`): Granular business events and metrics
- **Sources** (`src/`): Raw data source abstractions for lineage tracking and documentation

## 🔐 Access Control

Grant-based access is configured for Snowflake roles:
- `transform` role: Full transformation and model-building rights
- `reporter` role: Read-only access for reporting and analysis

## 📈 dbt Cloud Features Utilized

- **Git Integration**: Automatic detection of repository changes
- **Scheduled Runs**: Regular model execution via dbt Cloud jobs
- **Documentation**: Auto-generated dbt docs hosted in dbt Cloud
- **Testing**: Integrated data quality testing with failure tracking
- **Notifications**: Alert on job success/failure
- **Lineage**: Visual data lineage tracking in dbt Cloud interface

## 📝 Resources

- [dbt Cloud Documentation](https://docs.getdbt.com/docs/dbt-cloud/about-cloud-setup)
- [Snowflake Setup Guide](https://docs.getdbt.com/docs/core-connections/snowflake-setup)
- [dbt Documentation](https://docs.getdbt.com/docs/introduction)
- [dbt Community Discourse](https://discourse.getdbt.com/)
- [dbt Community](https://getdbt.com/community)
- [dbt Blog](https://blog.getdbt.com/)

## 🤝 Contributing

This is a capstone project. Contributions and suggestions are welcome!

## 📄 License

This project is open source and available under the MIT License.

---

**Last Updated**: September 3, 2026  
**Maintained by**: VaishnaviBarge
