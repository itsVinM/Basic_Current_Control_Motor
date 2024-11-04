# Basic Current Control Motor

This Simulink model demonstrates the concept of basic current control for a motor. The model consists of the following blocks:

- **Voltage Source:** The voltage source represents the electrical power source that supplies the motor.
- **Integrator:** This block integrates the motor current to obtain the motor torque.
- **Proportional Gain Block:** This block acts as the current controller, multiplying the current error by a proportional gain to produce a current control signal.
- **Saturation Block:** This block limits the current control signal to prevent excessive current flow in the motor.
- **Pulse Width Modulation (PWM) Block:** This block converts the current control signal into a PWM signal, which is the waveform applied to the motor's power stage.
- **Motor:** This block represents the motor, which converts the electrical energy into mechanical torque and rotation.
- **Rotor Current Measurement:** This block measures the actual rotor current of the motor.


<img width="800" height="300" src="https://github.com/itsVinM/itsVinM/assets/85823292/42388035-9611-450f-8b04-8667a34c1b25" align="center">


