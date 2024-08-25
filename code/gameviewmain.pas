{ Main view, where most of the application logic takes place.

  Feel free to use this code as a starting point for your own projects.
  This template code is in public domain, unlike most other CGE code which
  is covered by BSD or LGPL (see https://castle-engine.io/license). }
unit GameViewMain;

interface

uses Classes,
  CastleVectors, CastleComponentSerialize,
  CastleUIControls, CastleControls, CastleKeysMouse,
  CastleTransform,Math;

type
  { Main view, where most of the application logic takes place. }
  TViewMain = class(TCastleView)
  protected
    VelocidadRotacion: double;
  published
    { Components designed using CGE editor.
      These fields will be automatically initialized at Start. }
    LabelFps: TCastleLabel;
    Tablero: TCastleTransform;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Start; override;
    procedure Update(const SecondsPassed: single; var HandleInput: boolean); override;
    function Press(const Event: TInputPressRelease): boolean; override;
  end;

const
  AnguloMaximo: double = 45;
  AnguloMinimo: double = -45;

var
  ViewMain: TViewMain;

implementation

uses SysUtils,CastleLog;

  { TViewMain ----------------------------------------------------------------- }

constructor TViewMain.Create(AOwner: TComponent);
begin
  inherited;
  DesignUrl := 'castle-data:/gameviewmain.castle-user-interface';
end;

procedure TViewMain.Start;
begin
  inherited;
end;

procedure TViewMain.Update(const SecondsPassed: single; var HandleInput: boolean);
begin
  inherited;
  { This virtual method is executed every frame (many times per second). }
  Assert(LabelFps <> nil,
    'If you remove LabelFps from the design, remember to remove also the assignment "LabelFps.Caption := ..." from code');
  LabelFps.Caption := 'FPS: ' + Container.Fps.ToString;
  //if (VelocidadRotacion <> 0) and (Tablero.Rotation.W=0) then
  //begin
  //   Tablero.Rotation:=Vector4(1,0,0,Pi/2);
  //end
  //
end;

function TViewMain.Press(const Event: TInputPressRelease): boolean;
begin
  Result := inherited;
  if Result then Exit; // allow the ancestor to handle keys

  { This virtual method is executed when user presses
    a key, a mouse button, or touches a touch-screen.

    Note that each UI control has also events like OnPress and OnClick.
    These events can be used to handle the "press", if it should do something
    specific when used in that UI control.
    The TViewMain.Press method should be used to handle keys
    not handled in children controls.
  }

  // Use this to handle keys:
  {
  if Event.IsKey(keyXxx) then
  begin
    // DoSomething;
    Exit(true); // key was handled
  end;
  }
  if Event.IsKey(keyA) then
  begin
    //VelocidadRotacion :=  0.1;
    Tablero.Rotation:=Vector4(0,0,1,Pi/2);
    WritelnLog(Tablero.Rotation.ToString);
    Exit(True);
  end;
  if Event.IsKey(keyD) then
  begin
    VelocidadRotacion :=  - 0.1;
    Exit(True);
  end;
end;

end.
