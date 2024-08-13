import { Ability, AbilityStage, Want } from '@kit.AbilityKit';

export default class myAbilityStage extends AbilityStage{
  onAcceptWant(want: Want): string {
      if(want.abilityName === 'DocumentAbility'){
        globalThis.inkey = want.parameters?.key
        return `DocAbilityKey_${want.parameters?.key}`
      }
      return ''
  }

}