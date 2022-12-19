namespace Quantized.Lib
{
    open Microsoft.Quantum.Intrinsic;

    operation CoinFlip (count : Int, initial : Result) : (Int, Int)
    {
        mutable oneCount = 0;
        use q = Qubit[1];

        for i in 1..count
        {
            Set (initial, q[0]);

            // Comment out, or change to X, H gate to see the difference
            H(q[0]);

            let res = M (q[0]);

            if (res == One)
            {
                set oneCount = oneCount + 1;
            }

            Set(Zero, q[0]);
        }

        return (count - oneCount, oneCount);
    }
}