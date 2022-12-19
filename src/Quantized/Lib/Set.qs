namespace Quantized.Lib
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation Set (desired: Result, q1: Qubit) : Unit
    {
        let current = M(q1);

        if (desired != current)
        {
            X(q1);
        }
    }
}