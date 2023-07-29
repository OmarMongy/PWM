# Pulse Width Modulation (PWM) Verilog Controller

## Overview
This GitHub repository contains a Verilog project that implements a configurable Pulse Width Modulation (PWM) controller. The PWM controller is a widely used technique for efficiently controlling the power delivered to loads and regulating signals. The project includes two modules: PWM and timer_counter_inp, providing users with a versatile and customizable PWM solution for various applications.

## PWM Module
The PWM module generates the PWM signal based on the duty cycle value and the timer. The module takes user-defined parameters, such as resolution (R) and timer width (Timer), to tailor the PWM controller for specific requirements. This module utilizes two internal registers, **Q_reg** and **D_reg**, to store the current values for the counter and the duty cycle comparison.

**Inputs**
- **clk**: Clock signal used for synchronization.
- **reset_n**: Asynchronous active-low reset signal.
- **Final_Value**: Timer value representing the PWM period.
- **duty**: Duty cycle value.

**Outputs**
- **pwm_out**: The PWM output signal.

**Operation**
The always block triggered on the positive clock edge and negative reset signal is responsible for updating the **Q_reg** and **D_reg** values based on the current tick signal.
The always block triggered on any change in the inputs is responsible for calculating the next values for **Q_reg** and **D_reg** based on the current values, thus generating the PWM output.

## Timer Counter Module
The timer_counter_inp module is a configurable timer counter that counts from 0 to the user-defined **final_value**. It provides a simple and efficient way to generate timing signals for various applications.


**Inputs**
- **clk**: Clock signal used for synchronization.
- **reset_n**: Asynchronous active-low reset signal.
- **enable**: Control signal to enable the timer.
- **final_value**: The final value for the timer counter.

**Outputs**
- **done**: Indicates when the timer has reached the final_value.

**Operation**
The timer counter module uses an always block triggered on the positive clock edge and negative reset signal to update the counter's value when the enable signal is high. When the counter reaches the **final_value**, the **done** output is set high, indicating that the desired timing interval has elapsed ,One of the key features of the timer_counter_inp module is its ability to control the frequency of the output PWM signal.
By configuring the final_value parameter, users can adjust the timer's counting value, which directly affects the PWM frequency.
The PWM frequency is inversely proportional to the timer's counting value. A larger final_value will result in a slower counting rate, leading to a lower PWM frequency. Conversely, a smaller final_value will increase the counting rate and raise the PWM frequency.


## Applications and Uses of PWM
The PWM controller implemented in this project has a wide range of applications and uses across various industries and electronic systems. Some of the key applications include:

- Motor Control: Efficient speed control of DC motors, servo motors, and brushless DC motors.
- LED Dimming: Precise brightness control for LED lighting systems.
- Switching Power Supplies: Core component for regulating output voltage in power supply circuits.
- Audio Amplification: Used in Class D audio amplifiers for high-efficiency audio signal amplification.
- Heating Control: Temperature regulation in heating systems.
- Battery Charging: Efficient charging of batteries in various applications.
- Communication Systems: PWM used as a modulation technique in some wireless communication systems.
- Voltage Regulation: Regulating output voltage in voltage regulator circuits.
- Robotics: Control of actuators and servos in robotic systems.
- Solar Power Systems: Charging regulation in solar charge controllers.
- Frequency Regulation: Control of output signal frequency in certain applications.
- Temperature Control: Power regulation for heating or cooling elements in temperature control systems.

## Repository Structure
The repository contains the following files:

- **Source**: Verilog source file containing the PWM and the timer_counter_inp module code.
- **Sim**: Verilog testbench for the PWM module including the simulation results.
- **README.md**: Detailed explanation of the project, its modules, and their applications.
