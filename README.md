# VGA Interface Project with Vivado

## Overview
This project implements a VGA interface using VHDL in Vivado. The VGA interface is capable of displaying images stored in COE (Coefficient) file format. The project includes a VGA controller, a pixel pusher, and a BRAM (Block RAM) module to store image data.

## Project Structure
- **/src**: Contains the VHDL source files for the project.
- **/coe**: Contains the COE files for images that can be displayed.
- **/constraints**: Contains the constraint files (.xdc) for the project.

## How to Use
1. **Setup Vivado Environment**: Make sure you have Vivado installed and set up.
2. **Clone the Repository**: Clone this repository to your local machine.
3. **Open Vivado**: Open Vivado and create a new project.
4. **Add Source Files**: Add the VHDL source files from the `/src` directory to your Vivado project.
5. **Add Constraints**: Add the constraint files from the `/constraints` directory to your Vivado project.
6. **Synthesize and Implement**: Run synthesis and implementation processes in Vivado.
7. **Generate Bitstream**: Once synthesis and implementation are successful, generate the bitstream.
8. **Program the FPGA**: Program your FPGA with the generated bitstream.
9. **Prepare COE Files**: Ensure you have COE files for the images you want to display in the `/coe` directory.
10. **Load COE Files**: Modify the VHDL code as necessary to load the desired COE file and configure the VGA interface to display the image.

## Files
- `vga_controller.vhd`: VHDL code for the VGA controller module.
- `pixel_pusher.vhd`: VHDL code for the pixel pusher module.
- `bram.vhd`: VHDL code for the Block RAM module.
- `*.coe`: COE files containing image data in COE format.
- `*.xdc`: Constraint files for the project.


