# boltz_apptainer
Files required for setting up [Boltz1](https://github.com/jwohlwend/boltz) in an apptainer image.

To build the image:
`apptainer build --nv boltz.sif boltz.def`

To run the image:
`apptainer run --nv boltz.sif boltz predict input_path`

Instructions for prediction can be found on the [Boltz repo](https://github.com/jwohlwend/boltz/blob/main/docs/prediction.md)
