{-# OPTIONS_GHC -w #-}
module Parser where

import Token
import AST
--import Eval
import qualified Lex as L
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18
	| HappyAbsSyn19 t19

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,190) ([0,24608,13313,0,49152,2,0,32896,53253,0,0,0,0,512,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,104,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,512,0,0,2048,0,0,4096,0,0,128,0,0,0,0,2,33664,8192,0,1792,16385,0,3584,2,0,0,0,0,0,0,192,0,0,0,32768,0,208,0,0,0,0,0,0,0,4,0,0,48,4096,0,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,33664,0,0,0,12290,0,0,0,0,24576,16128,0,14336,8,2,0,32,3,0,0,0,0,1,416,32768,131,32,0,263,64,0,0,0,0,1052,0,0,2104,0,0,4208,0,0,8416,0,0,16832,0,0,33664,0,0,1792,1,0,3584,2,0,4096,0,26,49152,16,0,28672,16,0,57344,32,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32,15360,0,384,0,0,768,0,0,1536,0,0,3072,0,0,6144,0,0,12288,0,0,32768,1,0,0,3,0,0,0,0,0,0,0,0,0,0,0,2,832,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_calc","Programa","Bloco","Comando","If","While","Atrib","Read","ExprL","ExprR","Decls","Decl","ListaId","Type","Expr","Term","Factor","LITInt","LITDouble","ID","OPAdd","OPSub","OPMul","OPDiv","OPAtrib","LPar","RPar","TInt","TDouble","TVoid","TString","OPLt","OPGt","OPLe","OPGe","OPEq","OPNe","OPAnd","OPOr","OPNot","KwIf","KwElse","KwWhile","KwRead","PVirg","Virg","%eof"]
        bit_start = st Prelude.* 49
        bit_end = (st Prelude.+ 1) Prelude.* 49
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..48]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (22) = happyShift action_15
action_0 (30) = happyShift action_5
action_0 (31) = happyShift action_6
action_0 (33) = happyShift action_7
action_0 (43) = happyShift action_16
action_0 (45) = happyShift action_17
action_0 (46) = happyShift action_18
action_0 (4) = happyGoto action_8
action_0 (5) = happyGoto action_9
action_0 (6) = happyGoto action_10
action_0 (7) = happyGoto action_11
action_0 (8) = happyGoto action_12
action_0 (9) = happyGoto action_13
action_0 (10) = happyGoto action_14
action_0 (13) = happyGoto action_2
action_0 (14) = happyGoto action_3
action_0 (16) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (30) = happyShift action_5
action_1 (31) = happyShift action_6
action_1 (33) = happyShift action_7
action_1 (13) = happyGoto action_2
action_1 (14) = happyGoto action_3
action_1 (16) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (22) = happyShift action_15
action_2 (30) = happyShift action_5
action_2 (31) = happyShift action_6
action_2 (33) = happyShift action_7
action_2 (43) = happyShift action_16
action_2 (45) = happyShift action_17
action_2 (46) = happyShift action_18
action_2 (5) = happyGoto action_26
action_2 (6) = happyGoto action_10
action_2 (7) = happyGoto action_11
action_2 (8) = happyGoto action_12
action_2 (9) = happyGoto action_13
action_2 (10) = happyGoto action_14
action_2 (14) = happyGoto action_27
action_2 (16) = happyGoto action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_24

action_4 (22) = happyShift action_25
action_4 (15) = happyGoto action_24
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_28

action_6 _ = happyReduce_29

action_7 _ = happyReduce_30

action_8 (49) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (22) = happyShift action_15
action_9 (43) = happyShift action_16
action_9 (45) = happyShift action_17
action_9 (46) = happyShift action_18
action_9 (6) = happyGoto action_23
action_9 (7) = happyGoto action_11
action_9 (8) = happyGoto action_12
action_9 (9) = happyGoto action_13
action_9 (10) = happyGoto action_14
action_9 _ = happyReduce_2

action_10 _ = happyReduce_4

action_11 _ = happyReduce_5

action_12 _ = happyReduce_6

action_13 _ = happyReduce_7

action_14 _ = happyReduce_8

action_15 (27) = happyShift action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (28) = happyShift action_21
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (28) = happyShift action_20
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (22) = happyShift action_19
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (47) = happyShift action_42
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (20) = happyShift action_33
action_20 (21) = happyShift action_34
action_20 (22) = happyShift action_35
action_20 (28) = happyShift action_36
action_20 (42) = happyShift action_40
action_20 (11) = happyGoto action_41
action_20 (12) = happyGoto action_38
action_20 (17) = happyGoto action_39
action_20 (18) = happyGoto action_31
action_20 (19) = happyGoto action_32
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (20) = happyShift action_33
action_21 (21) = happyShift action_34
action_21 (22) = happyShift action_35
action_21 (28) = happyShift action_36
action_21 (42) = happyShift action_40
action_21 (11) = happyGoto action_37
action_21 (12) = happyGoto action_38
action_21 (17) = happyGoto action_39
action_21 (18) = happyGoto action_31
action_21 (19) = happyGoto action_32
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (20) = happyShift action_33
action_22 (21) = happyShift action_34
action_22 (22) = happyShift action_35
action_22 (28) = happyShift action_36
action_22 (17) = happyGoto action_30
action_22 (18) = happyGoto action_31
action_22 (19) = happyGoto action_32
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_3

action_24 (47) = happyShift action_28
action_24 (48) = happyShift action_29
action_24 _ = happyFail (happyExpListPerState 24)

action_25 _ = happyReduce_27

action_26 (22) = happyShift action_15
action_26 (43) = happyShift action_16
action_26 (45) = happyShift action_17
action_26 (46) = happyShift action_18
action_26 (6) = happyGoto action_23
action_26 (7) = happyGoto action_11
action_26 (8) = happyGoto action_12
action_26 (9) = happyGoto action_13
action_26 (10) = happyGoto action_14
action_26 _ = happyReduce_1

action_27 _ = happyReduce_23

action_28 _ = happyReduce_25

action_29 (22) = happyShift action_60
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (23) = happyShift action_47
action_30 (24) = happyShift action_48
action_30 (47) = happyShift action_59
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (25) = happyShift action_57
action_31 (26) = happyShift action_58
action_31 _ = happyReduce_33

action_32 _ = happyReduce_36

action_33 _ = happyReduce_37

action_34 _ = happyReduce_38

action_35 _ = happyReduce_39

action_36 (20) = happyShift action_33
action_36 (21) = happyShift action_34
action_36 (22) = happyShift action_35
action_36 (28) = happyShift action_36
action_36 (17) = happyGoto action_56
action_36 (18) = happyGoto action_31
action_36 (19) = happyGoto action_32
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (29) = happyShift action_55
action_37 (40) = happyShift action_44
action_37 (41) = happyShift action_45
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_16

action_39 (23) = happyShift action_47
action_39 (24) = happyShift action_48
action_39 (34) = happyShift action_49
action_39 (35) = happyShift action_50
action_39 (36) = happyShift action_51
action_39 (37) = happyShift action_52
action_39 (38) = happyShift action_53
action_39 (39) = happyShift action_54
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (20) = happyShift action_33
action_40 (21) = happyShift action_34
action_40 (22) = happyShift action_35
action_40 (28) = happyShift action_36
action_40 (42) = happyShift action_40
action_40 (11) = happyGoto action_46
action_40 (12) = happyGoto action_38
action_40 (17) = happyGoto action_39
action_40 (18) = happyGoto action_31
action_40 (19) = happyGoto action_32
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (29) = happyShift action_43
action_41 (40) = happyShift action_44
action_41 (41) = happyShift action_45
action_41 _ = happyFail (happyExpListPerState 41)

action_42 _ = happyReduce_12

action_43 (22) = happyShift action_15
action_43 (43) = happyShift action_16
action_43 (45) = happyShift action_17
action_43 (46) = happyShift action_18
action_43 (5) = happyGoto action_75
action_43 (6) = happyGoto action_10
action_43 (7) = happyGoto action_11
action_43 (8) = happyGoto action_12
action_43 (9) = happyGoto action_13
action_43 (10) = happyGoto action_14
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (20) = happyShift action_33
action_44 (21) = happyShift action_34
action_44 (22) = happyShift action_35
action_44 (28) = happyShift action_36
action_44 (42) = happyShift action_40
action_44 (11) = happyGoto action_74
action_44 (12) = happyGoto action_38
action_44 (17) = happyGoto action_39
action_44 (18) = happyGoto action_31
action_44 (19) = happyGoto action_32
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (20) = happyShift action_33
action_45 (21) = happyShift action_34
action_45 (22) = happyShift action_35
action_45 (28) = happyShift action_36
action_45 (42) = happyShift action_40
action_45 (11) = happyGoto action_73
action_45 (12) = happyGoto action_38
action_45 (17) = happyGoto action_39
action_45 (18) = happyGoto action_31
action_45 (19) = happyGoto action_32
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (40) = happyShift action_44
action_46 (41) = happyShift action_45
action_46 _ = happyReduce_15

action_47 (20) = happyShift action_33
action_47 (21) = happyShift action_34
action_47 (22) = happyShift action_35
action_47 (28) = happyShift action_36
action_47 (18) = happyGoto action_72
action_47 (19) = happyGoto action_32
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (20) = happyShift action_33
action_48 (21) = happyShift action_34
action_48 (22) = happyShift action_35
action_48 (28) = happyShift action_36
action_48 (18) = happyGoto action_71
action_48 (19) = happyGoto action_32
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (20) = happyShift action_33
action_49 (21) = happyShift action_34
action_49 (22) = happyShift action_35
action_49 (28) = happyShift action_36
action_49 (17) = happyGoto action_70
action_49 (18) = happyGoto action_31
action_49 (19) = happyGoto action_32
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (20) = happyShift action_33
action_50 (21) = happyShift action_34
action_50 (22) = happyShift action_35
action_50 (28) = happyShift action_36
action_50 (17) = happyGoto action_69
action_50 (18) = happyGoto action_31
action_50 (19) = happyGoto action_32
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (20) = happyShift action_33
action_51 (21) = happyShift action_34
action_51 (22) = happyShift action_35
action_51 (28) = happyShift action_36
action_51 (17) = happyGoto action_68
action_51 (18) = happyGoto action_31
action_51 (19) = happyGoto action_32
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (20) = happyShift action_33
action_52 (21) = happyShift action_34
action_52 (22) = happyShift action_35
action_52 (28) = happyShift action_36
action_52 (17) = happyGoto action_67
action_52 (18) = happyGoto action_31
action_52 (19) = happyGoto action_32
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (20) = happyShift action_33
action_53 (21) = happyShift action_34
action_53 (22) = happyShift action_35
action_53 (28) = happyShift action_36
action_53 (17) = happyGoto action_66
action_53 (18) = happyGoto action_31
action_53 (19) = happyGoto action_32
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (20) = happyShift action_33
action_54 (21) = happyShift action_34
action_54 (22) = happyShift action_35
action_54 (28) = happyShift action_36
action_54 (17) = happyGoto action_65
action_54 (18) = happyGoto action_31
action_54 (19) = happyGoto action_32
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (22) = happyShift action_15
action_55 (43) = happyShift action_16
action_55 (45) = happyShift action_17
action_55 (46) = happyShift action_18
action_55 (5) = happyGoto action_64
action_55 (6) = happyGoto action_10
action_55 (7) = happyGoto action_11
action_55 (8) = happyGoto action_12
action_55 (9) = happyGoto action_13
action_55 (10) = happyGoto action_14
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (23) = happyShift action_47
action_56 (24) = happyShift action_48
action_56 (29) = happyShift action_63
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (20) = happyShift action_33
action_57 (21) = happyShift action_34
action_57 (22) = happyShift action_35
action_57 (28) = happyShift action_36
action_57 (19) = happyGoto action_62
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (20) = happyShift action_33
action_58 (21) = happyShift action_34
action_58 (22) = happyShift action_35
action_58 (28) = happyShift action_36
action_58 (19) = happyGoto action_61
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_11

action_60 _ = happyReduce_26

action_61 _ = happyReduce_35

action_62 _ = happyReduce_34

action_63 _ = happyReduce_40

action_64 (22) = happyShift action_15
action_64 (43) = happyShift action_16
action_64 (44) = happyShift action_76
action_64 (45) = happyShift action_17
action_64 (46) = happyShift action_18
action_64 (6) = happyGoto action_23
action_64 (7) = happyGoto action_11
action_64 (8) = happyGoto action_12
action_64 (9) = happyGoto action_13
action_64 (10) = happyGoto action_14
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (23) = happyShift action_47
action_65 (24) = happyShift action_48
action_65 _ = happyReduce_22

action_66 (23) = happyShift action_47
action_66 (24) = happyShift action_48
action_66 _ = happyReduce_21

action_67 (23) = happyShift action_47
action_67 (24) = happyShift action_48
action_67 _ = happyReduce_20

action_68 (23) = happyShift action_47
action_68 (24) = happyShift action_48
action_68 _ = happyReduce_19

action_69 (23) = happyShift action_47
action_69 (24) = happyShift action_48
action_69 _ = happyReduce_18

action_70 (23) = happyShift action_47
action_70 (24) = happyShift action_48
action_70 _ = happyReduce_17

action_71 (25) = happyShift action_57
action_71 (26) = happyShift action_58
action_71 _ = happyReduce_32

action_72 (25) = happyShift action_57
action_72 (26) = happyShift action_58
action_72 _ = happyReduce_31

action_73 (40) = happyShift action_44
action_73 (41) = happyShift action_45
action_73 _ = happyReduce_14

action_74 (40) = happyShift action_44
action_74 (41) = happyShift action_45
action_74 _ = happyReduce_13

action_75 (22) = happyShift action_15
action_75 (43) = happyShift action_16
action_75 (45) = happyShift action_17
action_75 (46) = happyShift action_18
action_75 (6) = happyGoto action_23
action_75 (7) = happyGoto action_11
action_75 (8) = happyGoto action_12
action_75 (9) = happyGoto action_13
action_75 (10) = happyGoto action_14
action_75 _ = happyReduce_10

action_76 (22) = happyShift action_15
action_76 (43) = happyShift action_16
action_76 (45) = happyShift action_17
action_76 (46) = happyShift action_18
action_76 (5) = happyGoto action_77
action_76 (6) = happyGoto action_10
action_76 (7) = happyGoto action_11
action_76 (8) = happyGoto action_12
action_76 (9) = happyGoto action_13
action_76 (10) = happyGoto action_14
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (22) = happyShift action_15
action_77 (43) = happyShift action_16
action_77 (45) = happyShift action_17
action_77 (46) = happyShift action_18
action_77 (6) = happyGoto action_23
action_77 (7) = happyGoto action_11
action_77 (8) = happyGoto action_12
action_77 (9) = happyGoto action_13
action_77 (10) = happyGoto action_14
action_77 _ = happyReduce_9

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn4
		 (AST.Prog happy_var_1 happy_var_2
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (AST.Prog [] happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 ++ [happy_var_2]
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happyReduce 7 7 happyReduction_9
happyReduction_9 ((HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (AST.If happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 5 8 happyReduction_10
happyReduction_10 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AST.While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 4 9 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn17  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token.ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AST.Atrib happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  10 happyReduction_12
happyReduction_12 _
	(HappyTerminal (Token.ID happy_var_2))
	_
	 =  HappyAbsSyn10
		 (AST.Leitura happy_var_2
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  11 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (AST.And happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  11 happyReduction_14
happyReduction_14 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn11
		 (AST.Or happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  11 happyReduction_15
happyReduction_15 (HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (AST.Not happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  11 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (AST.Rel happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  12 happyReduction_17
happyReduction_17 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (AST.Rlt happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  12 happyReduction_18
happyReduction_18 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (AST.Rgt happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (AST.Rle happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (AST.Rge happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (AST.Req happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn17  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn12
		 (AST.Rdif happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  13 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_2)
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1 ++ happy_var_2
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  13 happyReduction_24
happyReduction_24 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn15  happy_var_2)
	(HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 (map (\i -> i :#: (happy_var_1, 0)) happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  15 happyReduction_26
happyReduction_26 (HappyTerminal (Token.ID happy_var_3))
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  15 happyReduction_27
happyReduction_27 (HappyTerminal (Token.ID happy_var_1))
	 =  HappyAbsSyn15
		 ([happy_var_1]
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  16 happyReduction_28
happyReduction_28 _
	 =  HappyAbsSyn16
		 (AST.TInt
	)

happyReduce_29 = happySpecReduce_1  16 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn16
		 (AST.TDouble
	)

happyReduce_30 = happySpecReduce_1  16 happyReduction_30
happyReduction_30 _
	 =  HappyAbsSyn16
		 (AST.TString
	)

happyReduce_31 = happySpecReduce_3  17 happyReduction_31
happyReduction_31 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (AST.Add happy_var_1 happy_var_3
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  17 happyReduction_32
happyReduction_32 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (AST.Sub happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  17 happyReduction_33
happyReduction_33 (HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  18 happyReduction_34
happyReduction_34 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (AST.Mul happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  18 happyReduction_35
happyReduction_35 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn18
		 (AST.Div happy_var_1 happy_var_3
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_1  18 happyReduction_36
happyReduction_36 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn18
		 (happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  19 happyReduction_37
happyReduction_37 (HappyTerminal (Token.LITInt happy_var_1))
	 =  HappyAbsSyn19
		 (AST.Const (AST.CInt happy_var_1)
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  19 happyReduction_38
happyReduction_38 (HappyTerminal (Token.LITDouble happy_var_1))
	 =  HappyAbsSyn19
		 (AST.Const (AST.CDouble happy_var_1)
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  19 happyReduction_39
happyReduction_39 (HappyTerminal (Token.ID happy_var_1))
	 =  HappyAbsSyn19
		 (AST.IdVar happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  19 happyReduction_40
happyReduction_40 _
	(HappyAbsSyn17  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (happy_var_2
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 49 49 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Token.LITInt happy_dollar_dollar -> cont 20;
	Token.LITDouble happy_dollar_dollar -> cont 21;
	Token.ID happy_dollar_dollar -> cont 22;
	Token.OPAdd -> cont 23;
	Token.OPSub -> cont 24;
	Token.OPMul -> cont 25;
	Token.OPDiv -> cont 26;
	Token.OPAtrib -> cont 27;
	Token.LPar -> cont 28;
	Token.RPar -> cont 29;
	Token.TInt -> cont 30;
	Token.TDouble -> cont 31;
	Token.TVoid -> cont 32;
	Token.TString -> cont 33;
	Token.OPLt -> cont 34;
	Token.OPGt -> cont 35;
	Token.OPLe -> cont 36;
	Token.OPGe -> cont 37;
	Token.OPEq -> cont 38;
	Token.OPNe -> cont 39;
	Token.OPAnd -> cont 40;
	Token.OPOr -> cont 41;
	Token.OPNot -> cont 42;
	Token.KwIf -> cont 43;
	Token.KwElse -> cont 44;
	Token.KwWhile -> cont 45;
	Token.KwRead -> cont 46;
	Token.PVirg -> cont 47;
	Token.Virg -> cont 48;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 49 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
calc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)

main = do putStr "Expressão:"
          s <- getLine
          let a = calc (L.alexScanTokens s)
          print a
          -- print (eval [] a)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
