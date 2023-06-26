import { NgModule, assertInInjectionContext } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { HttpClientModule } from '@angular/common/http';
import { RegistroComponent } from '../components/registro/registro.component';
import { MenuComponent } from './menu/menu.component';
import { EstudianteComponent } from '../components/estudiante/estudiante.component';
import { MateriaComponent } from '../components/materia/materia.component';
import { NewCarreraComponent } from '../components/new-carrera/new-carrera.component';
import { NewMateriaComponent } from '../components/new-materia/new-materia.component';
import { EditMateriaComponent } from '../components/edit-materia/edit-materia.component';
import { AsginarMateriaComponent } from '../components/asginar-materia/asginar-materia.component';


@NgModule({
  declarations: [
    RegistroComponent,
    MenuComponent,
    EstudianteComponent,
    MateriaComponent,
    NewCarreraComponent,
    NewMateriaComponent,
    EditMateriaComponent,
    AsginarMateriaComponent
    
  ],
  imports: [
    CommonModule,
    IonicModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
  ],
  exports: [
    CommonModule,
    IonicModule,
    HttpClientModule,
    RegistroComponent,
    FormsModule,
    ReactiveFormsModule,
    MenuComponent,
    EstudianteComponent,
    MateriaComponent,
    NewCarreraComponent,
    NewMateriaComponent,
    EditMateriaComponent,
    AsginarMateriaComponent
    
  ],
})
export class SharedModule {}
