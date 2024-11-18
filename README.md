# boltz_apptainer
Files which allow you to set up [Boltz-1](https://github.com/jwohlwend/boltz) in an apptainer image. This allows for running on HPCs without sudo or docker access.

To build the image:
`apptainer build --nv boltz.sif boltz.def`

To run the image:
`apptainer run --nv boltz.sif boltz predict input_path`

Instructions for prediction can be found on the [Boltz repo](https://github.com/jwohlwend/boltz/blob/main/docs/prediction.md)
