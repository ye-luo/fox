module m_common_charset

  ! Written to use ASCII charset only. Full UNICODE would
  ! take much more work and need a proper unicode library.

  implicit none
  private

  interface operator(.in.)
    module procedure belongs
  end interface

  character(len=1), parameter :: SPACE           = achar(32)
  character(len=1), parameter :: NEWLINE         = achar(10)
  character(len=1), parameter :: CARRIAGE_RETURN = achar(13)
  character(len=1), parameter :: TAB             = achar(9)

  character(len=*), parameter :: whitespace = SPACE//NEWLINE//CARRIAGE_RETURN//TAB

  character(len=*), parameter :: lowerCase = "abcdefghijklmnopqrstuvwxyz"
  character(len=*), parameter :: upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  character(len=*), parameter :: digits = "0123456789"
  character(len=*), parameter :: NameChars = lowerCase//upperCase//digits//".-_:"
  character(len=*), parameter :: InitialNameChars = lowerCase//upperCase//"-_:"

  character(len=*), parameter :: PubIdChars = NameChars//whitespace//"'()+,/=?;!*#@$%"
  character(len=*), parameter :: validchars = &
       whitespace//"!""#$%&'()*+,-./"//digits// &
       ":;<=>?@"//upperCase//"[\]^_`"//lowerCase//"{|}~"
  ! these are all the standard ASCII printable characters: whitespace + (33-126)
  ! which are the only characters we can guarantee to know how to handle properly.

  integer, parameter :: XML1_0 = 10
  integer, parameter :: XML1_1 = 11

  character(len=*), parameter :: XML1_0_NAMECHARS = NameChars
  character(len=*), parameter :: XML1_1_NAMECHARS = NameChars

  character(len=*), parameter :: XML1_0_INITIALNAMECHARS = InitialNameChars
  character(len=*), parameter :: XML1_1_INITIALNAMECHARS = InitialNameChars

  character(len=*), parameter :: XML_WHITESPACE = whitespace
  character(len=*), parameter :: XML_INITIALENCODINGCHARS = lowerCase//upperCase
  character(len=*), parameter :: XML_ENCODINGCHARS = lowerCase//upperCase//digits//'._-'

  public :: operator(.in.)

  public :: InitialNameChars
  public :: NameChars
  public :: validchars
  public :: whitespace
  public :: uppercase

  public :: digits

  public :: XML1_0
  public :: XML1_1
  public :: XML1_0_NAMECHARS
  public :: XML1_1_NAMECHARS
  public :: XML1_0_INITIALNAMECHARS
  public :: XML1_1_INITIALNAMECHARS
  public :: XML_WHITESPACE
  public :: XML_INITIALENCODINGCHARS
  public :: XML_ENCODINGCHARS

contains

  function belongs(c,charset)  result(res)
    character(len=1), intent(in)  :: c
    character(len=*), intent(in)  :: charset
    logical                       :: res

    res = (verify(c, charset) == 0)

  end function belongs

end module m_common_charset









