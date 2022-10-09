namespace Quantized.Samples {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    operation Teleport(msg : Qubit, target : Qubit) : Unit {
        use register = Qubit();

        // Create some entanglement that we can use to send our message.
        H(register);
        CNOT(register, target); // Control NOT Gates

        // Encode the message into the entangled pair.
        CNOT(msg, register);
        H(msg);

        if (MResetZ(msg) == One) { Z(target); }

        if (IsResultOne(MResetZ(register))) { X(target); }
    }

    operation TeleportClassicalMessage(message : Bool) : Bool {
        body {
            mutable measurement = false;

            use register = Qubit[2] {
                // Ask for some qubits that we can use to teleport.
                let msg = register[0];
                let there = register[1];

                // Encode the message we want to send.
                if (message) { X(msg); }

                // Use the operation we defined above
                Teleport(msg, there);

                // Check what message was sent.
                if (M(there) == One) { set measurement = true; }

                // Reset all of the qubits that we used before releasing them.
                ResetAll(register);
            }

            return measurement;
        }
    }
}