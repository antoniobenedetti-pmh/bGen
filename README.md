# bGen: Machine Learning for In-Silico Data Generation in Small-Data Batch Process Monitoring

![GitHub Logo](https://github.com/antoniobenedetti-pmh/bGen/blob/main/BGen%20Logo.png)

## Introduction

In the field of batch process monitoring, the effectiveness of traditional multivariate techniques like Principal Component Analysis (PCA) and Partial Least Square (PLS) heavily relies on the availability of substantial historical manufacturing data. These methods require ample data to create robust models for monitoring the normal operation of a process. However, the challenge arises when dealing with new products in a manufacturing facility or niche processes where historical data is scarce. Such situations give rise to what we term "small-data scenarios," where the standard tools fall short.

This repository presents **bGen**, a powerful and innovative tool for batch process monitoring, particularly tailored for small-data scenarios. bGen is based on a data-driven methodology, as previously reported in the literature (Tulsyan, Garvin & Ündey, J. Process Control, 2019), which leverages machine learning algorithms rooted in Gaussian process state-space models to generate in-silico batch trajectory data from limited historical records. This synthetic data, when combined with the existing real-world data, forms the foundation for constructing an effective process monitoring model.

## Key Features and Benefits

bGen offers several key features and benefits:

1. **In-Silico Data Generation**: bGen employs machine learning techniques to create synthetic batch trajectory data, effectively mitigating the limitations of small-data scenarios.

2. **Parameter Tuning Automation**: The tool includes automatic procedures for fine-tuning the machine learning framework's parameters. This streamlines the generation of consistent in-silico data and facilitates industrial-level deployment.

3. **Monitoring-Relevant Metrics**: We have developed specific indicators and a metric to evaluate the appropriateness of in-silico data for process monitoring, ensuring the generated data aligns with the monitoring requirements.

4. **Benchmark Validation**: To verify the utility of the in-silico generated data, bGen includes datasets from a benchmark simulated semi-batch process for penicillin manufacturing. These datasets allow for a thorough investigation of the tool's effectiveness.

## Getting Started

Please refer to the [**bGen LiveApp User Manual**](#) for detailed instructions on setting up and using bGen for your batch process monitoring needs.

## How bGen Works

**bGen LiveApp** is a MATLAB Live Script designed to address the challenge of generating in-silico low-frequency trajectories from high-frequency variable trajectories obtained from real batches (input). This unique tool is especially valuable when building a process monitoring model becomes challenging due to the limited availability of historical batch data, often referred to as the "low-N" scenario.

The **bGen LiveApp** script is thoughtfully organized into sections, each serving a specific purpose. We've incorporated user-friendly control elements to enhance the interaction with the code and to make it adaptable to various data templates and scenarios. For an optimal experience, we recommend running each section individually in accordance with the script's sequential organization. This approach allows end users to easily interact with the embedded control elements and explore the full potential of **bGen LiveApp**.

For in-depth guidance on how to utilize the LiveApp's capabilities, please refer to our comprehensive [**bGen LiveApp User Manual**](#). This manual provides detailed insights and instructions to help you make the most of this powerful tool.

## Future Work

We are actively developing a Python version of the tool to expand its compatibility and usability. Stay tuned for updates and improvements as we continue to enhance bGen to meet your batch process monitoring needs in the Python ecosystem.


## Feedback and Contributions

We welcome feedback, bug reports, and contributions from the community. Feel free to [**open an issue**](https://github.com/antoniobenedetti-pmh/BGen/issues) or [**submit a pull request**](https://github.com/antoniobenedetti-pmh/BGen/pulls) to make bGen even more robust and valuable for the batch process monitoring community.

## Citation

If you find bGen useful in your work, please consider citing the original paper: Gasparini, L., Benedetti, A., Marchese, G., Gallagher, C., Facco, P., & Barolo, M. (2023). On the use of machine learning to generate in-silico data for batch process monitoring under small-data scenarios. Computers & Chemical Engineering . https://doi.org/10.1016/j.compchemeng.2023.108469


## License

bGen is released under the [**Apache 2.0**](#), ensuring that it remains open and accessible to the community.

---

Unlock the potential of small-data scenarios in batch process monitoring with bGen. Dive into our documentation to start using this cutting-edge tool today!

