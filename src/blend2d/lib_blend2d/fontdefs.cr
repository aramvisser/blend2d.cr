# This file is automatically generated and should not be manually edited

module Blend2D
  @[Link("blend2d")]
  lib LibBlend2D
    alias BLGlyphId = UInt32

    enum BLOrientation : UInt32
      Horizontal = 0
      Vertical   = 1
    end

    enum BLFontFaceType : UInt32
      None     = 0
      Opentype = 1
    end

    enum BLFontStretch : UInt32
      UltraCondensed = 1
      ExtraCondensed = 2
      Condensed      = 3
      SemiCondensed  = 4
      Normal         = 5
      SemiExpanded   = 6
      Expanded       = 7
      ExtraExpanded  = 8
      UltraExpanded  = 9
    end

    enum BLFontStyle : UInt32
      Normal  = 0
      Oblique = 1
      Italic  = 2
    end

    enum BLFontWeight : UInt32
      Thin       = 100
      ExtraLight = 200
      Light      = 300
      SemiLight  = 350
      Normal     = 400
      Medium     = 500
      SemiBold   = 600
      Bold       = 700
      ExtraBold  = 800
      Black      = 900
      ExtraBlack = 950
    end

    enum BLFontStringId : UInt32
      CopyrightNotice            =   0
      FamilyName                 =   1
      SubfamilyName              =   2
      UniqueIdentifier           =   3
      FullName                   =   4
      VersionString              =   5
      PostScriptName             =   6
      Trademark                  =   7
      ManufacturerName           =   8
      DesignerName               =   9
      Description                =  10
      VendorUrl                  =  11
      DesignerUrl                =  12
      LicenseDescription         =  13
      LicenseInfoUrl             =  14
      Reserved                   =  15
      TypographicFamilyName      =  16
      TypographicSubfamilyName   =  17
      CompatibleFullName         =  18
      SampleText                 =  19
      PostScriptCidName          =  20
      WwsFamilyName              =  21
      WwsSubfamilyName           =  22
      LightBackgroundPalette     =  23
      DarkBackgroundPalette      =  24
      VariationsPostScriptPrefix =  25
      CustomStartIndex           = 255
    end

    enum BLFontUnicodeCoverageIndex : UInt32
      CIndexBasicLatin                          =   0
      CIndexLatin1Supplement                    =   1
      CIndexLatinExtendedA                      =   2
      CIndexLatinExtendedB                      =   3
      CIndexIpaExtensions                       =   4
      CIndexSpacingModifierLetters              =   5
      CIndexCombiningDiacriticalMarks           =   6
      CIndexGreekAndCoptic                      =   7
      CIndexCoptic                              =   8
      CIndexCyrillic                            =   9
      CIndexArmenian                            =  10
      CIndexHebrew                              =  11
      CIndexVai                                 =  12
      CIndexArabic                              =  13
      CIndexNko                                 =  14
      CIndexDevanagari                          =  15
      CIndexBengali                             =  16
      CIndexGurmukhi                            =  17
      CIndexGujarati                            =  18
      CIndexOriya                               =  19
      CIndexTamil                               =  20
      CIndexTelugu                              =  21
      CIndexKannada                             =  22
      CIndexMalayalam                           =  23
      CIndexThai                                =  24
      CIndexLao                                 =  25
      CIndexGeorgian                            =  26
      CIndexBalinese                            =  27
      CIndexHangulJamo                          =  28
      CIndexLatinExtendedAdditional             =  29
      CIndexGreekExtended                       =  30
      CIndexGeneralPunctuation                  =  31
      CIndexSuperscriptsAndSubscripts           =  32
      CIndexCurrencySymbols                     =  33
      CIndexCombiningDiacriticalMarksForSymbols =  34
      CIndexLetterlikeSymbols                   =  35
      CIndexNumberForms                         =  36
      CIndexArrows                              =  37
      CIndexMathematicalOperators               =  38
      CIndexMiscellaneousTechnical              =  39
      CIndexControlPictures                     =  40
      CIndexOpticalCharacterRecognition         =  41
      CIndexEnclosedAlphanumerics               =  42
      CIndexBoxDrawing                          =  43
      CIndexBlockElements                       =  44
      CIndexGeometricShapes                     =  45
      CIndexMiscellaneousSymbols                =  46
      CIndexDingbats                            =  47
      CIndexCjkSymbolsAndPunctuation            =  48
      CIndexHiragana                            =  49
      CIndexKatakana                            =  50
      CIndexBopomofo                            =  51
      CIndexHangulCompatibilityJamo             =  52
      CIndexPhagsPa                             =  53
      CIndexEnclosedCjkLettersAndMonths         =  54
      CIndexCjkCompatibility                    =  55
      CIndexHangulSyllables                     =  56
      CIndexNonPlane                            =  57
      CIndexPhoenician                          =  58
      CIndexCjkUnifiedIdeographs                =  59
      CIndexPrivateUsePlane0                    =  60
      CIndexCjkStrokes                          =  61
      CIndexAlphabeticPresentationForms         =  62
      CIndexArabicPresentationFormsA            =  63
      CIndexCombiningHalfMarks                  =  64
      CIndexVerticalForms                       =  65
      CIndexSmallFormVariants                   =  66
      CIndexArabicPresentationFormsB            =  67
      CIndexHalfwidthAndFullwidthForms          =  68
      CIndexSpecials                            =  69
      CIndexTibetan                             =  70
      CIndexSyriac                              =  71
      CIndexThaana                              =  72
      CIndexSinhala                             =  73
      CIndexMyanmar                             =  74
      CIndexEthiopic                            =  75
      CIndexCherokee                            =  76
      CIndexUnifiedCanadianAboriginalSyllabics  =  77
      CIndexOgham                               =  78
      CIndexRunic                               =  79
      CIndexKhmer                               =  80
      CIndexMongolian                           =  81
      CIndexBraillePatterns                     =  82
      CIndexYiSyllablesAndRadicals              =  83
      CIndexTagalogHanunooBuhidTagbanwa         =  84
      CIndexOldItalic                           =  85
      CIndexGothic                              =  86
      CIndexDeseret                             =  87
      CIndexMusicalSymbols                      =  88
      CIndexMathematicalAlphanumericSymbols     =  89
      CIndexPrivateUsePlane1516                 =  90
      CIndexVariationSelectors                  =  91
      CIndexTags                                =  92
      CIndexLimbu                               =  93
      CIndexTaiLe                               =  94
      CIndexNewTaiLue                           =  95
      CIndexBuginese                            =  96
      CIndexGlagolitic                          =  97
      CIndexTifinagh                            =  98
      CIndexYijingHexagramSymbols               =  99
      CIndexSylotiNagri                         = 100
      CIndexLinearBSyllabaryAndIdeograms        = 101
      CIndexAncientGreekNumbers                 = 102
      CIndexUgaritic                            = 103
      CIndexOldPersian                          = 104
      CIndexShavian                             = 105
      CIndexOsmanya                             = 106
      CIndexCypriotSyllabary                    = 107
      CIndexKharoshthi                          = 108
      CIndexTaiXuanJingSymbols                  = 109
      CIndexCuneiform                           = 110
      CIndexCountingRodNumerals                 = 111
      CIndexSundanese                           = 112
      CIndexLepcha                              = 113
      CIndexOlChiki                             = 114
      CIndexSaurashtra                          = 115
      CIndexKayahLi                             = 116
      CIndexRejang                              = 117
      CIndexCham                                = 118
      CIndexAncientSymbols                      = 119
      CIndexPhaistosDisc                        = 120
      CIndexCarianLycianLydian                  = 121
      CIndexDominoAndMahjongTiles               = 122
      CIndexInternalUsage123                    = 123
      CIndexInternalUsage124                    = 124
      CIndexInternalUsage125                    = 125
      CIndexInternalUsage126                    = 126
      CIndexInternalUsage127                    = 127
    end

    enum BLTextDirection : UInt32
      Ltr = 0
      Rtl = 1
    end

    struct BLGlyphInfo
      cluster : UInt32
      reserved : UInt32
    end

    struct BLGlyphPlacement
      placement : BLPointI
      advance : BLPointI
    end

    struct BLGlyphMappingState
      glyph_count : LibC::ULong
      undefined_first : LibC::ULong
      undefined_count : LibC::ULong
    end

    struct BLGlyphOutlineSinkInfo
      glyph_index : LibC::ULong
      contour_count : LibC::ULong
    end

    struct BLFontUnicodeCoverage
      data : UInt32[4]
    end

    struct BLFontPanose
      family_kind : UInt8
      symbol_kind : UInt8
      weight : UInt8
      spacing : UInt8
      aspect_ratio_and_contrast : UInt8
      aspect_ratio94 : UInt8
      aspect_ratio119 : UInt8
      aspect_ratio157 : UInt8
      aspect_ratio163 : UInt8
      aspect_ratio211 : UInt8
    end

    struct BLFontMatrix
      m00 : Float64
      m01 : Float64
      m10 : Float64
      m11 : Float64
    end

    struct BLFontMetrics
      size : Float32
      ascent_by_orientation : Float32[2]
      descent_by_orientation : Float32[2]
      line_gap : Float32
      x_height : Float32
      cap_height : Float32
      x_min : Float32
      y_min : Float32
      x_max : Float32
      y_max : Float32
      underline_position : Float32
      underline_thickness : Float32
      strikethrough_position : Float32
      strikethrough_thickness : Float32
    end

    struct BLFontDesignMetrics
      units_per_em : Int32
      lowest_ppem : Int32
      line_gap : Int32
      x_height : Int32
      cap_height : Int32
      ascent_by_orientation : Int32[2]
      descent_by_orientation : Int32[2]
      min_lsb_by_orientation : Int32[2]
      min_tsb_by_orientation : Int32[2]
      max_advance_by_orientation : Int32[2]
      glyph_bounding_box : BLBoxI
      underline_position : Int32
      underline_thickness : Int32
      strikethrough_position : Int32
      strikethrough_thickness : Int32
    end

    struct BLTextMetrics
      advance : BLPoint
      leading_bearing : BLPoint
      trailing_bearing : BLPoint
      bounding_box : BLBox
    end
  end
end
