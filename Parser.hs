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

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21
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
	| HappyAbsSyn20 t20
	| HappyAbsSyn21 t21

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,226) ([0,32896,53253,3,0,176,0,0,5634,3904,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,31232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,128,0,0,4096,0,0,0,2,0,0,64,0,0,2104,0,1,6144,0,32,0,12,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16832,0,0,0,0,0,0,263,0,0,128,0,0,7168,4,1,32768,131,32,0,4208,0,0,0,0,0,0,0,6144,0,0,0,0,1024,32768,30,0,0,0,0,0,0,0,512,0,0,32768,1,512,0,1024,96,0,0,0,0,49152,32256,0,0,263,64,0,16384,1536,0,0,8,0,0,268,0,0,8576,0,0,3584,2,0,49152,65,0,0,2104,0,0,1792,1,0,0,0,0,0,384,0,0,12288,0,0,0,0,0,0,0,0,0,0,0,0,0,0,256,0,0,8192,0,128,53248,3,7168,4,1,32768,131,32,0,0,0,0,3584,2,0,49152,65,0,0,2104,0,0,1792,1,0,57344,32,0,0,1052,0,0,512,16384,15,0,0,0,0,0,0,0,256,57344,7,49152,0,0,0,24,0,0,768,0,0,24576,0,0,0,12,0,0,384,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,31232,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_calc","Programa","Bloco","Comando","If","While","Atrib","Read","Print","Return","ExprL","ExprR","Decls","Decl","ListaId","Type","Expr","Term","Factor","LITInt","LITDouble","ID","OPAdd","OPSub","OPMul","OPDiv","OPAtrib","LPar","RPar","TInt","TDouble","TVoid","TString","OPLt","OPGt","OPLe","OPGe","OPEq","OPNe","OPAnd","OPOr","OPNot","KwIf","KwElse","KwWhile","KwRead","KwPrint","KwReturn","PVirg","Virg","%eof"]
        bit_start = st Prelude.* 53
        bit_end = (st Prelude.+ 1) Prelude.* 53
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..52]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (24) = happyShift action_17
action_0 (32) = happyShift action_5
action_0 (33) = happyShift action_6
action_0 (35) = happyShift action_7
action_0 (45) = happyShift action_18
action_0 (47) = happyShift action_19
action_0 (48) = happyShift action_20
action_0 (49) = happyShift action_21
action_0 (50) = happyShift action_22
action_0 (4) = happyGoto action_8
action_0 (5) = happyGoto action_9
action_0 (6) = happyGoto action_10
action_0 (7) = happyGoto action_11
action_0 (8) = happyGoto action_12
action_0 (9) = happyGoto action_13
action_0 (10) = happyGoto action_14
action_0 (11) = happyGoto action_15
action_0 (12) = happyGoto action_16
action_0 (15) = happyGoto action_2
action_0 (16) = happyGoto action_3
action_0 (18) = happyGoto action_4
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (32) = happyShift action_5
action_1 (33) = happyShift action_6
action_1 (35) = happyShift action_7
action_1 (15) = happyGoto action_2
action_1 (16) = happyGoto action_3
action_1 (18) = happyGoto action_4
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (24) = happyShift action_17
action_2 (32) = happyShift action_5
action_2 (33) = happyShift action_6
action_2 (35) = happyShift action_7
action_2 (45) = happyShift action_18
action_2 (47) = happyShift action_19
action_2 (48) = happyShift action_20
action_2 (49) = happyShift action_21
action_2 (50) = happyShift action_22
action_2 (5) = happyGoto action_39
action_2 (6) = happyGoto action_10
action_2 (7) = happyGoto action_11
action_2 (8) = happyGoto action_12
action_2 (9) = happyGoto action_13
action_2 (10) = happyGoto action_14
action_2 (11) = happyGoto action_15
action_2 (12) = happyGoto action_16
action_2 (16) = happyGoto action_40
action_2 (18) = happyGoto action_4
action_2 _ = happyFail (happyExpListPerState 2)

action_3 _ = happyReduce_29

action_4 (24) = happyShift action_38
action_4 (17) = happyGoto action_37
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_33

action_6 _ = happyReduce_34

action_7 _ = happyReduce_35

action_8 (53) = happyAccept
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (24) = happyShift action_17
action_9 (45) = happyShift action_18
action_9 (47) = happyShift action_19
action_9 (48) = happyShift action_20
action_9 (49) = happyShift action_21
action_9 (50) = happyShift action_22
action_9 (6) = happyGoto action_36
action_9 (7) = happyGoto action_11
action_9 (8) = happyGoto action_12
action_9 (9) = happyGoto action_13
action_9 (10) = happyGoto action_14
action_9 (11) = happyGoto action_15
action_9 (12) = happyGoto action_16
action_9 _ = happyReduce_2

action_10 _ = happyReduce_4

action_11 _ = happyReduce_5

action_12 _ = happyReduce_6

action_13 _ = happyReduce_7

action_14 _ = happyReduce_8

action_15 _ = happyReduce_9

action_16 _ = happyReduce_10

action_17 (29) = happyShift action_35
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (30) = happyShift action_34
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (30) = happyShift action_33
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (30) = happyShift action_32
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (30) = happyShift action_31
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (22) = happyShift action_26
action_22 (23) = happyShift action_27
action_22 (24) = happyShift action_28
action_22 (30) = happyShift action_29
action_22 (51) = happyShift action_30
action_22 (19) = happyGoto action_23
action_22 (20) = happyGoto action_24
action_22 (21) = happyGoto action_25
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (25) = happyShift action_54
action_23 (26) = happyShift action_55
action_23 (51) = happyShift action_56
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (27) = happyShift action_52
action_24 (28) = happyShift action_53
action_24 _ = happyReduce_38

action_25 _ = happyReduce_41

action_26 _ = happyReduce_42

action_27 _ = happyReduce_43

action_28 _ = happyReduce_44

action_29 (22) = happyShift action_26
action_29 (23) = happyShift action_27
action_29 (24) = happyShift action_28
action_29 (30) = happyShift action_29
action_29 (19) = happyGoto action_51
action_29 (20) = happyGoto action_24
action_29 (21) = happyGoto action_25
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_17

action_31 (22) = happyShift action_26
action_31 (23) = happyShift action_27
action_31 (24) = happyShift action_28
action_31 (30) = happyShift action_29
action_31 (19) = happyGoto action_50
action_31 (20) = happyGoto action_24
action_31 (21) = happyGoto action_25
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (24) = happyShift action_49
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (22) = happyShift action_26
action_33 (23) = happyShift action_27
action_33 (24) = happyShift action_28
action_33 (30) = happyShift action_29
action_33 (44) = happyShift action_47
action_33 (13) = happyGoto action_48
action_33 (14) = happyGoto action_45
action_33 (19) = happyGoto action_46
action_33 (20) = happyGoto action_24
action_33 (21) = happyGoto action_25
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (22) = happyShift action_26
action_34 (23) = happyShift action_27
action_34 (24) = happyShift action_28
action_34 (30) = happyShift action_29
action_34 (44) = happyShift action_47
action_34 (13) = happyGoto action_44
action_34 (14) = happyGoto action_45
action_34 (19) = happyGoto action_46
action_34 (20) = happyGoto action_24
action_34 (21) = happyGoto action_25
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (22) = happyShift action_26
action_35 (23) = happyShift action_27
action_35 (24) = happyShift action_28
action_35 (30) = happyShift action_29
action_35 (19) = happyGoto action_43
action_35 (20) = happyGoto action_24
action_35 (21) = happyGoto action_25
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_3

action_37 (51) = happyShift action_41
action_37 (52) = happyShift action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_32

action_39 (24) = happyShift action_17
action_39 (45) = happyShift action_18
action_39 (47) = happyShift action_19
action_39 (48) = happyShift action_20
action_39 (49) = happyShift action_21
action_39 (50) = happyShift action_22
action_39 (6) = happyGoto action_36
action_39 (7) = happyGoto action_11
action_39 (8) = happyGoto action_12
action_39 (9) = happyGoto action_13
action_39 (10) = happyGoto action_14
action_39 (11) = happyGoto action_15
action_39 (12) = happyGoto action_16
action_39 _ = happyReduce_1

action_40 _ = happyReduce_28

action_41 _ = happyReduce_30

action_42 (24) = happyShift action_76
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (25) = happyShift action_54
action_43 (26) = happyShift action_55
action_43 (51) = happyShift action_75
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (31) = happyShift action_74
action_44 (42) = happyShift action_65
action_44 (43) = happyShift action_66
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_21

action_46 (25) = happyShift action_54
action_46 (26) = happyShift action_55
action_46 (36) = happyShift action_68
action_46 (37) = happyShift action_69
action_46 (38) = happyShift action_70
action_46 (39) = happyShift action_71
action_46 (40) = happyShift action_72
action_46 (41) = happyShift action_73
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (22) = happyShift action_26
action_47 (23) = happyShift action_27
action_47 (24) = happyShift action_28
action_47 (30) = happyShift action_29
action_47 (44) = happyShift action_47
action_47 (13) = happyGoto action_67
action_47 (14) = happyGoto action_45
action_47 (19) = happyGoto action_46
action_47 (20) = happyGoto action_24
action_47 (21) = happyGoto action_25
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (31) = happyShift action_64
action_48 (42) = happyShift action_65
action_48 (43) = happyShift action_66
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (31) = happyShift action_63
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (25) = happyShift action_54
action_50 (26) = happyShift action_55
action_50 (31) = happyShift action_62
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (25) = happyShift action_54
action_51 (26) = happyShift action_55
action_51 (31) = happyShift action_61
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (22) = happyShift action_26
action_52 (23) = happyShift action_27
action_52 (24) = happyShift action_28
action_52 (30) = happyShift action_29
action_52 (21) = happyGoto action_60
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (22) = happyShift action_26
action_53 (23) = happyShift action_27
action_53 (24) = happyShift action_28
action_53 (30) = happyShift action_29
action_53 (21) = happyGoto action_59
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (22) = happyShift action_26
action_54 (23) = happyShift action_27
action_54 (24) = happyShift action_28
action_54 (30) = happyShift action_29
action_54 (20) = happyGoto action_58
action_54 (21) = happyGoto action_25
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (22) = happyShift action_26
action_55 (23) = happyShift action_27
action_55 (24) = happyShift action_28
action_55 (30) = happyShift action_29
action_55 (20) = happyGoto action_57
action_55 (21) = happyGoto action_25
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_16

action_57 (27) = happyShift action_52
action_57 (28) = happyShift action_53
action_57 _ = happyReduce_37

action_58 (27) = happyShift action_52
action_58 (28) = happyShift action_53
action_58 _ = happyReduce_36

action_59 _ = happyReduce_40

action_60 _ = happyReduce_39

action_61 _ = happyReduce_45

action_62 (51) = happyShift action_88
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (51) = happyShift action_87
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (24) = happyShift action_17
action_64 (45) = happyShift action_18
action_64 (47) = happyShift action_19
action_64 (48) = happyShift action_20
action_64 (49) = happyShift action_21
action_64 (50) = happyShift action_22
action_64 (5) = happyGoto action_86
action_64 (6) = happyGoto action_10
action_64 (7) = happyGoto action_11
action_64 (8) = happyGoto action_12
action_64 (9) = happyGoto action_13
action_64 (10) = happyGoto action_14
action_64 (11) = happyGoto action_15
action_64 (12) = happyGoto action_16
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (22) = happyShift action_26
action_65 (23) = happyShift action_27
action_65 (24) = happyShift action_28
action_65 (30) = happyShift action_29
action_65 (44) = happyShift action_47
action_65 (13) = happyGoto action_85
action_65 (14) = happyGoto action_45
action_65 (19) = happyGoto action_46
action_65 (20) = happyGoto action_24
action_65 (21) = happyGoto action_25
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (22) = happyShift action_26
action_66 (23) = happyShift action_27
action_66 (24) = happyShift action_28
action_66 (30) = happyShift action_29
action_66 (44) = happyShift action_47
action_66 (13) = happyGoto action_84
action_66 (14) = happyGoto action_45
action_66 (19) = happyGoto action_46
action_66 (20) = happyGoto action_24
action_66 (21) = happyGoto action_25
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (42) = happyShift action_65
action_67 (43) = happyShift action_66
action_67 _ = happyReduce_20

action_68 (22) = happyShift action_26
action_68 (23) = happyShift action_27
action_68 (24) = happyShift action_28
action_68 (30) = happyShift action_29
action_68 (19) = happyGoto action_83
action_68 (20) = happyGoto action_24
action_68 (21) = happyGoto action_25
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (22) = happyShift action_26
action_69 (23) = happyShift action_27
action_69 (24) = happyShift action_28
action_69 (30) = happyShift action_29
action_69 (19) = happyGoto action_82
action_69 (20) = happyGoto action_24
action_69 (21) = happyGoto action_25
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (22) = happyShift action_26
action_70 (23) = happyShift action_27
action_70 (24) = happyShift action_28
action_70 (30) = happyShift action_29
action_70 (19) = happyGoto action_81
action_70 (20) = happyGoto action_24
action_70 (21) = happyGoto action_25
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (22) = happyShift action_26
action_71 (23) = happyShift action_27
action_71 (24) = happyShift action_28
action_71 (30) = happyShift action_29
action_71 (19) = happyGoto action_80
action_71 (20) = happyGoto action_24
action_71 (21) = happyGoto action_25
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (22) = happyShift action_26
action_72 (23) = happyShift action_27
action_72 (24) = happyShift action_28
action_72 (30) = happyShift action_29
action_72 (19) = happyGoto action_79
action_72 (20) = happyGoto action_24
action_72 (21) = happyGoto action_25
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (22) = happyShift action_26
action_73 (23) = happyShift action_27
action_73 (24) = happyShift action_28
action_73 (30) = happyShift action_29
action_73 (19) = happyGoto action_78
action_73 (20) = happyGoto action_24
action_73 (21) = happyGoto action_25
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (24) = happyShift action_17
action_74 (45) = happyShift action_18
action_74 (47) = happyShift action_19
action_74 (48) = happyShift action_20
action_74 (49) = happyShift action_21
action_74 (50) = happyShift action_22
action_74 (5) = happyGoto action_77
action_74 (6) = happyGoto action_10
action_74 (7) = happyGoto action_11
action_74 (8) = happyGoto action_12
action_74 (9) = happyGoto action_13
action_74 (10) = happyGoto action_14
action_74 (11) = happyGoto action_15
action_74 (12) = happyGoto action_16
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_13

action_76 _ = happyReduce_31

action_77 (24) = happyShift action_17
action_77 (45) = happyShift action_18
action_77 (46) = happyShift action_89
action_77 (47) = happyShift action_19
action_77 (48) = happyShift action_20
action_77 (49) = happyShift action_21
action_77 (50) = happyShift action_22
action_77 (6) = happyGoto action_36
action_77 (7) = happyGoto action_11
action_77 (8) = happyGoto action_12
action_77 (9) = happyGoto action_13
action_77 (10) = happyGoto action_14
action_77 (11) = happyGoto action_15
action_77 (12) = happyGoto action_16
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (25) = happyShift action_54
action_78 (26) = happyShift action_55
action_78 _ = happyReduce_27

action_79 (25) = happyShift action_54
action_79 (26) = happyShift action_55
action_79 _ = happyReduce_26

action_80 (25) = happyShift action_54
action_80 (26) = happyShift action_55
action_80 _ = happyReduce_25

action_81 (25) = happyShift action_54
action_81 (26) = happyShift action_55
action_81 _ = happyReduce_24

action_82 (25) = happyShift action_54
action_82 (26) = happyShift action_55
action_82 _ = happyReduce_23

action_83 (25) = happyShift action_54
action_83 (26) = happyShift action_55
action_83 _ = happyReduce_22

action_84 (42) = happyShift action_65
action_84 (43) = happyShift action_66
action_84 _ = happyReduce_19

action_85 (42) = happyShift action_65
action_85 (43) = happyShift action_66
action_85 _ = happyReduce_18

action_86 (24) = happyShift action_17
action_86 (45) = happyShift action_18
action_86 (47) = happyShift action_19
action_86 (48) = happyShift action_20
action_86 (49) = happyShift action_21
action_86 (50) = happyShift action_22
action_86 (6) = happyGoto action_36
action_86 (7) = happyGoto action_11
action_86 (8) = happyGoto action_12
action_86 (9) = happyGoto action_13
action_86 (10) = happyGoto action_14
action_86 (11) = happyGoto action_15
action_86 (12) = happyGoto action_16
action_86 _ = happyReduce_12

action_87 _ = happyReduce_14

action_88 _ = happyReduce_15

action_89 (24) = happyShift action_17
action_89 (45) = happyShift action_18
action_89 (47) = happyShift action_19
action_89 (48) = happyShift action_20
action_89 (49) = happyShift action_21
action_89 (50) = happyShift action_22
action_89 (5) = happyGoto action_90
action_89 (6) = happyGoto action_10
action_89 (7) = happyGoto action_11
action_89 (8) = happyGoto action_12
action_89 (9) = happyGoto action_13
action_89 (10) = happyGoto action_14
action_89 (11) = happyGoto action_15
action_89 (12) = happyGoto action_16
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (24) = happyShift action_17
action_90 (45) = happyShift action_18
action_90 (47) = happyShift action_19
action_90 (48) = happyShift action_20
action_90 (49) = happyShift action_21
action_90 (50) = happyShift action_22
action_90 (6) = happyGoto action_36
action_90 (7) = happyGoto action_11
action_90 (8) = happyGoto action_12
action_90 (9) = happyGoto action_13
action_90 (10) = happyGoto action_14
action_90 (11) = happyGoto action_15
action_90 (12) = happyGoto action_16
action_90 _ = happyReduce_11

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
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

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happyReduce 7 7 happyReduction_11
happyReduction_11 ((HappyAbsSyn5  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (AST.If happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 5 8 happyReduction_12
happyReduction_12 ((HappyAbsSyn5  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (AST.While happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 4 9 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token.ID happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (AST.Atrib happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happyReduce 5 10 happyReduction_14
happyReduction_14 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Token.ID happy_var_3)) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (AST.Leitura happy_var_3
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 5 11 happyReduction_15
happyReduction_15 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn19  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AST.Imp happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  12 happyReduction_16
happyReduction_16 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (AST.Ret (Just happy_var_2)
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  12 happyReduction_17
happyReduction_17 _
	_
	 =  HappyAbsSyn12
		 (AST.Ret Nothing
	)

happyReduce_18 = happySpecReduce_3  13 happyReduction_18
happyReduction_18 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AST.And happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  13 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (AST.Or happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  13 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (AST.Not happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  13 happyReduction_21
happyReduction_21 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (AST.Rel happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  14 happyReduction_22
happyReduction_22 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn14
		 (AST.Rlt happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  14 happyReduction_23
happyReduction_23 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn14
		 (AST.Rgt happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  14 happyReduction_24
happyReduction_24 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn14
		 (AST.Rle happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn14
		 (AST.Rge happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn14
		 (AST.Req happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn14
		 (AST.Rdif happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_2  15 happyReduction_28
happyReduction_28 (HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1 ++ happy_var_2
	)
happyReduction_28 _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  16 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn17  happy_var_2)
	(HappyAbsSyn18  happy_var_1)
	 =  HappyAbsSyn16
		 (map (\i -> i :#: (happy_var_1, 0)) happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_3  17 happyReduction_31
happyReduction_31 (HappyTerminal (Token.ID happy_var_3))
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn17
		 (happy_var_1 ++ [happy_var_3]
	)
happyReduction_31 _ _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  17 happyReduction_32
happyReduction_32 (HappyTerminal (Token.ID happy_var_1))
	 =  HappyAbsSyn17
		 ([happy_var_1]
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  18 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn18
		 (AST.TInt
	)

happyReduce_34 = happySpecReduce_1  18 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn18
		 (AST.TDouble
	)

happyReduce_35 = happySpecReduce_1  18 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn18
		 (AST.TString
	)

happyReduce_36 = happySpecReduce_3  19 happyReduction_36
happyReduction_36 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AST.Add happy_var_1 happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  19 happyReduction_37
happyReduction_37 (HappyAbsSyn20  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AST.Sub happy_var_1 happy_var_3
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  19 happyReduction_38
happyReduction_38 (HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_3  20 happyReduction_39
happyReduction_39 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (AST.Mul happy_var_1 happy_var_3
	)
happyReduction_39 _ _ _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_3  20 happyReduction_40
happyReduction_40 (HappyAbsSyn21  happy_var_3)
	_
	(HappyAbsSyn20  happy_var_1)
	 =  HappyAbsSyn20
		 (AST.Div happy_var_1 happy_var_3
	)
happyReduction_40 _ _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  20 happyReduction_41
happyReduction_41 (HappyAbsSyn21  happy_var_1)
	 =  HappyAbsSyn20
		 (happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_1  21 happyReduction_42
happyReduction_42 (HappyTerminal (Token.LITInt happy_var_1))
	 =  HappyAbsSyn21
		 (AST.Const (AST.CInt happy_var_1)
	)
happyReduction_42 _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  21 happyReduction_43
happyReduction_43 (HappyTerminal (Token.LITDouble happy_var_1))
	 =  HappyAbsSyn21
		 (AST.Const (AST.CDouble happy_var_1)
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  21 happyReduction_44
happyReduction_44 (HappyTerminal (Token.ID happy_var_1))
	 =  HappyAbsSyn21
		 (AST.IdVar happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_3  21 happyReduction_45
happyReduction_45 _
	(HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn21
		 (happy_var_2
	)
happyReduction_45 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 53 53 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Token.LITInt happy_dollar_dollar -> cont 22;
	Token.LITDouble happy_dollar_dollar -> cont 23;
	Token.ID happy_dollar_dollar -> cont 24;
	Token.OPAdd -> cont 25;
	Token.OPSub -> cont 26;
	Token.OPMul -> cont 27;
	Token.OPDiv -> cont 28;
	Token.OPAtrib -> cont 29;
	Token.LPar -> cont 30;
	Token.RPar -> cont 31;
	Token.TInt -> cont 32;
	Token.TDouble -> cont 33;
	Token.TVoid -> cont 34;
	Token.TString -> cont 35;
	Token.OPLt -> cont 36;
	Token.OPGt -> cont 37;
	Token.OPLe -> cont 38;
	Token.OPGe -> cont 39;
	Token.OPEq -> cont 40;
	Token.OPNe -> cont 41;
	Token.OPAnd -> cont 42;
	Token.OPOr -> cont 43;
	Token.OPNot -> cont 44;
	Token.KwIf -> cont 45;
	Token.KwElse -> cont 46;
	Token.KwWhile -> cont 47;
	Token.KwRead -> cont 48;
	Token.KwPrint -> cont 49;
	Token.KwReturn -> cont 50;
	Token.PVirg -> cont 51;
	Token.Virg -> cont 52;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 53 tk tks = happyError' (tks, explist)
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
