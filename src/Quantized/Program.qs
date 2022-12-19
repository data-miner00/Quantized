namespace Quantized
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Quantized.Lib;
    
    @EntryPoint()
    operation Run() : (Int, Int)
    {
        // let max = 50;
        // Message($"Sampling a random number between 0 and {max}");
        // return RandomNumberInRange(max);
        let count = 50;
        Message("Running a coin flipper");
        return CoinFlip(count, Zero);
    }
}
