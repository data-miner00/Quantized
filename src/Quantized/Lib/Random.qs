namespace Quantized.Lib {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation GetRandomBit() : Result {
        use q = Qubit();

        H(q);

        return M(q);
    }

    operation RandomNumberInRange(max: Int) : Int {
        mutable output = 0;
        repeat {
            mutable bits = [];
            for _ in 1..BitSizeI(max) {
                set bits += [GetRandomBit()];
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max);
        return output;
    }
}