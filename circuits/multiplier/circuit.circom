pragma circom 2.0.0;

/This circuit template checks that c is the multiplication of a and b./  

template Multiplier2 () {  
   signal input a_in;
   signal input b_in;

   signal X; 
   signal Y;

   signal output Q_out;

   component ANDgate=AND();
   component ORgate=OR();
   component NOTgate=NOT();

   ANDgate.a <== a_in ;
   ANDgate.b <== b_in ;
   X <== ANDgate.out ;

   NOTgate.in <== b_in ;
   Y <== NOTgate.out;

   ORgate.a <== X;
   ORgate.b <== Y;
   Q_out <== ORgate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
