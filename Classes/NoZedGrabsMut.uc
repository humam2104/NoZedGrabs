
class NoZedGrabsMut extends KFMutator;

function ModifyAIEnemy( AIController AI, Pawn Enemy )
{
    local KFPawn_Monster KFPM;
    KFPM = KFAIController(AI).MyKFPawn;

    if ( KFPawn_ZedClot(KFPM) != none )
    {
        RemoveGrabAbility(KFPawn_ZedClot(KFPM));
    }
    else if ( KFAIController_ZedDAR_EMP(AI) != none )
    {
        RemoveEDAREMPAttack(KFAIController_ZedDAR_EMP(AI));
    }
}

private function RemoveEDAREMPAttack(KFAIController_ZedDAR_EMP KF_EMP_EDAR)
{
    KF_EMP_EDAR.MinRangeAttackDist = 0.0f;
    KF_EMP_EDAR.MaxRangeAttackDist = 0.01f;
}

private function RemoveGrabAbility(KFPawn_ZedClot ClotPawn)
{
    ClotPawn.bCanGrabAttack = false;
}
