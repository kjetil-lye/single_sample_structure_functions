CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T112334        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.5</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?�g�K�v?�-�O >?�;jtM�?�|8>1$?�AJY�a?��a�:?�Cnv�@Q�;*�@��j���@��e
�@)�N�CF@	RS�=D@���@Lj{˷�@��7�`�@ �]�Y�@"q�P� @$\`Qhs�@&Yc��0�@(h�fOfs@*�ke���@,���L�@.��.@0��S
�0@1۾��k@3�����@4X'�u%@5��s��@6�����@8L�,��@9���57@;y�@<��`2:�@=��,N�@?xY
�@@~K"��s@AC���G@B�;���@B�Շ�9.@C�=3�)@Dz؝=s�@EP��"i�@F)z�za�@Gk�
q@G�e�E�@H�_k���@I�O���@J�-��8@K}�i�)�@Lk�� �@M[�j��@NO3]�u@OE.�wL�@P�f���@P����}<@Q�q�^�@Q�z�@R��
@R�� �_w@S$�{+5U@S�UqpiS@T1Z���@T�"�j��        ?�)��>�h?Ϳ����?�)�H!?�|rn��?�G-�UD)?��GI\�`@%!��+�@��R��@�p�֩N@��L�@e�ř�@X9����@��ن��@!�����w@#�=,�@&pHf��a@)"�am�@+�$���@.���.=�@0�����@2rb�r�@4�κ�@5���;JC@7}�jx�@9I%��@;"���@=	�_��@>��?z�@@���"[@A����@B�\��6f@C�}��~@D��Bju@E�	b���@GPE�$�@H@�8*e�@Iu�p_�@J�]l�f@K�@�jI@M8%��F-@N��j�s�@O׶\[-�@P�"}w�@QGM�я�@Q�V��1@R�8S!��@Se�*#q@T l�Y�@Tݱd��V@U������@V`s�&�}@W%��\1@W����@X�ћ0΋@Y�=*�:�@ZVC����@[(��>Џ@[��q0@\պs���@]���@�@^�����@_k���RA@`&��K�N        ?�+�&��?��W��~?ކ͢�QH?�)��im?������?�!� o(@҈Խ�@66y=@6g�Pu�@f�C3��@��D�J@���.@������@!.!G?�@#��Lu@%��d���@(�=X�/�@+4�u�u@.��A��@0v)��2@1�չaI�@3����@5+t�#	@6�+p��[@8��tHU@:ZN����@<.�\A��@>b�Y��@?�f��@@�e{�(�@A����0@C�����@D-��#q@E-3�R@FG���w@Ghd���
@H�eUB��@I��󥕆@J��|�	�@L!<v�@M\����U@N�".�y�@O������@P�į��c@Q>�+�m�@Q���:@R�yL}R@SD|�n�@S�ֈ3��@T�~8� ]@U_l";�W@V�u�'@V�����@W�����@XML?86y@Y.5p@Y�-�E��@Z�E���@[]p�=u2@\&�4�6@\���ӧ�@]�;wobz@^���@�        ?�ߚ�Y?���S�?�%=�~_�?�_bn�{@,�?@��M)	@N�%<@���e�`@��W�5@(J��@"�NK~um@%�;@0`�@)0���@,�C�襫@0N��ރ�@2Nk!���@4ePX��G@6����r�@8�M�}@;/>�>}@=�#�Z��@@�3E2
@AZ��4@B�ߋ�@D��Z�@Ev���@F�%K�/c@Hb�J%�@I�JJ��@Kr3��~@M�ނ�@N�l���@P%+/�@P���^@Q�2ŜKI@R�I9��@S�Oh��s@T�7dlX�@Uj����@VYpI�o�@WK�g0��@XA}_�ܪ@Y:�	k�@Z7�2F��@[8l
R~@\<[~���@]C��:�@^Nc���@_\eJ}UB@`6�m1�@`��4i@aL��)@a�Q��w@biDڗg@b������@c���(��@d7�{/@d�.��
@eJ�-�Ie@e�|�֠@f{�T��@g�		^�@g����        ?���1B>?�?�+φ�?�dmxf��?���°�?�I��m�?�8�w�;?���P�T@�a�A�@���ʛi@���}�@��e�;@�>#�d@�L!$@Rf�=C@��~Nqa@ ��iD��@"�w�Ʋ@$��t@&��@��B@(�� �}�@*��M�4[@-(?J�V@/|.9�@0����@2+��fV@3o�!9x@4��N��@6���@7iBPh �@8�-�!@Y@:6��.]&@;�s1iCX@=!�r��@>�Ё�@@�W�F�@@ۻ`���@A�T\��@BtR6�{@CE�h� �@DNj�d�@D�4�=�@E�Ok�Ő@F����}�@G��\4P@Hq^�W�O@IX��,{�@JC3$�Ł@K0���P@L �9 �@M�I��&@N	�U��@O�o�@O�V_�@P}�H+�A@P��,v�n@Q�5�n@R{�6*U@R��C���@S%=;��@S���F�*@T�}�I�@T� �{�@U.g��6�        ?�Uʹb|�?�@����i?��c�{�	?�/��;U?��M���?�;�&jѷ@�e�J~�@	/g
�f@rz��1%@*�PN��@��7�m`@�&=�@H�D�]t@!��D�@$b����T@&��gD��@)��9@V@,~�����@/s��n?@1D�4m�@2ݩ��@4�{X	�=@6><���@8���v@9٘D4N@;���}�@=�����@?��u�8@@���*i�@A��L;�@B��J��@D�?'@E8`jo��@F_Ot�6<@G�ws'1	@H��!p}�@I��A@K8Vdm�@L}w6���@M�^ @O��#@P7�.G��@P�k��f@Q��QEU�@RI9�{�@R�Q;.@S����r@Tr�(t�@U0"�(w5@U�'�S�@V���Q@Ww|��@X>�%� @YZ]Ao@Y�J�+��@Z�����@[s
����@\Eʻ_��@]��*�D@]��y��@^�/f1�@_���]��@`B��"7        ?�#�8A��?ί\,G��?�2�-��j?��쉼�G?�.�ۮL'?���9S�@ZI\��@	ȵ���@�#��F@�o� 3�@s��rL@�N6�t�@��N�@"Y�s�b@$�&��h�@'v�n~@*84s-O�@-��T=@0�Ɋ��@1����$@3@]�q@4�D��N<@6�(E���@8|��0��@:X�i2�@<CY��v@>;� Ӭ�@@!���@A+��Z�@B;ї���@CS5����@Dq+oQ�&@E��nM@F�sW:|p@G�mG��@I(���}w@Jft^�@K�����@L�R�4�@NC�O5@O�iWd8@Py��V@Q*1RF!"@Q�q�U��@R�~.��@SLM��� @T��&�@T��V�@U���w�x@VJ��Hx�@W�~�-@W�\����@X���Er@Yrd�Nb1@ZB����@[j�b�@[�u��@\�0�[�"@]�'�"��@^xv����@_W��N@`��V1@`���#t>        ?�pz�*h?�[<e�V
?����؛?��c� �Q@`-j��#@�8>n6@`�tc�l@	gZn��@5�s��@�AW8�@"�4�>�@&F�c�;�@)�j�KF�@-xx��)1@0��J��@2��{2B�@4� }Վ@7/�oo@9dPE��#@;��S��@>BqH�M@@h7����@A�;L�GL@C�<@Dx�|(3w@E�`ܛ� @G]y�Ȟ�@Hݝ����@Jf���M�@K�]�y�@M��@/O@O5V�N͇@Pp!��O@QI��}�@R'*�C�R@S���t�@S�����D@T��L�@U��U@V���ۢ�@W��H�M&@X�ޠz�E@Y�H�Axe@Z�/u�Y(@[��7��@\�AG�ً@]�UU*��@^��w�!@_�\��WO@`m�ϣ'�@`���Ð#@a�=#^3Q@bbdm�V@b�C��W@c4>_,��@c����,@d[^��@d�O�6@e��s��M@f 0��2@f���R�@gUY�e�s@g���_�        ?��a��r?��2����?� ��?�r�a�M ?��;�-�+?��uc(m?��v��'@o��$�@�
�s�@��/}\c@f��!'@'@�U{@����@%>��|@_LjU�.@�ȭ^�\@!�8~��@#t��=�U@%X�j���@'M�BXv@)R����C@+g�E�A@-�L���S@/�ᩑ�i@1,��|�@2)��0�o@3YW���i@4���O��@5�p��@7����@8\^z��@9����6�@; ���@<b�1�ƈ@=���/��@?0�*��<@@Po���@Ab�7�8@A�?�v��@B��Լ@CM�Lf��@D�-���@D�!�d�@E���c�@Fw�i�A�@GImj��@H���@H�l��!@I��1�L@J����p#@K����d@Lg��h@MK(��q@N0� �@O3�R�@P���0F@Pxt!��@P�)�w�i@Qi��D�@Q�K 8Z@R^JUE�9@Rڡ[wo4@SX��c        ?��y{��?�$Kp���?މ�"�p?�K�Ee?�߆�Չ!?�
bt�֮@��@ �
=�@�?v"@V���@�]s�h@¹%�Q@�/V�@!!4t�@#r� ��"@%�㾀fH@(ta~��+@+#eprh�@-�P�;��@0mIٵ�@1��
S�+@3��eW��@5";\�h�@6Ϥ�B<�@8����g�@:R妛Wu@<(W�#�@>
�`�'�@?��M��@@��7Ή�@A��]
A@C	*ج�@D:C,@E/V��@FKL|��@Gmݱ�a@H�r^��@I�zC�͠@J�n���@L,�5�@Mi��"[%@N�R�A�@O�cV�%�@P��\��@QJ|�q@Q��qxmY@R� ;��s@ST���b�@T$���]@T��㰭�@Uu�˺.�@V0S�F	�@V��e��@W�<���@Xm�����@Y1P�.@Y�:���@Z�[��2�@[��Cq�@\V,��f�@]$м"r(@]���:.�@^�o��         ?���~1?͝#H�qS?�@ɺsS?����Y�l?�l߅�
?�ؠ��ul@ONl�B@��pӧ�@uA�?o@��X�T@��- �@��W��a@��%m@!����@$���I�@&��uN}�@)H��@,c1��@.�@x�L<@17��2@2�C�,��@46t�f�@5�h'1?6@7����@9t�̫S�@;P�~)�@=:j!�^@?1�_@9@@�w�L�@A���.js@B�]�<��@Cʐ"�{�@D���t7@F	��e	@G2�6�@Ha�}��U@I��K�@J����@L���j�@MYY ��E@N��Qy�@O�`����@P�\<bڜ@QU��B@R�_+��@R��>c�@Sq���@T*	��@T堅�l@U��}A@Vdm4��@W'�1�:�@W�6��B@X�I����@Y�>4V@ZL�[h��@[�<+�r@[햗i1�@\��0Y�@]�џ`�X@^paͫt�@_K7��
@`'$*.�        ?�2+�?�:ٮu+?�tC�n$�?�Ʊ���@ �d"x/Q@X�P#�@0�1�@��E}@�~��@I<��u@"
q	|Z@%%W��D@(r��5��@+����Ґ@/��k.��@1������@3�0v�&@5���ݒf@8��"�@:A��A\@<��n��1@>���UEx@@�~]�ѿ@A���D�1@CL�G��@D�1X��
@F0/f:�@GipG�-@H�ȍuqz@JP��v�@K�)�O0@MU쥔^�@N�<b�5M@P<�pz�@Q��6Y<@QݩI�כ@R�X��v@S���p�@Ti mh�h@UIu��L@V,n��G�@W�t�b@W���-l�@X�1Z��@Y�H/ݟ@Zͮ+uQ@[�+�!]@\����@]�E�:pm@^����e@_�J|r�S@``ؚ�	|@`��X)S�@aj��{L	@a�g"G@by���^@cı��\@c��N0�@d����e@d�m�X��@e8�I��@e�R�O�@f[Gc���        ?�	RU�1?ŕ�wX��?֞]��Uy?�J:%ʘ�?�?1H�%�?��x��?�Y���N@����@�ɧ��@
Q��QΓ@E��u�@G!A�@t��W@���@!��Ƨ�@^'�Y��@ �]^O6/@"�
��@$m�"(�@&LI���@(9Ւ�\[@*5��X�g@,?���!�@.V��*�E@0=�t���@1Ve^�.�@2u[W�1!@3�r�f\�@4ŉ�e@i@5���(�@7-9Ճ�@8i��bY�@9����@:��.�f�@<?�jI.z@=�ܴGdo@>�.�M�7@@"�~��@@Ә#4�@A�����*@B<�I���@B��z:e@C�B=��h@Dl�t�@E+GI@E찮��@F�Rf�cK@Gv$�HRb@H>��@I<멃|@I�u�ʂ@J��Yy��@Ks%8L��@LE�'v��@M. �t@M�rX�G�@N��s���@O�7��v�@P?����B@P��!��
@Q�V!@Q��&�y�@R�����        ?��M�Ҁ?ͻ��r�x?�,SǶ7?ꪙ��tb?�Lg��?�������@*�<|#�@��+�j�@ƅ5��K@������@g=�m�3@W��9,@��-s�@!�7[I�@#�p�@&d��s?�@)�:��@+�Kg��@.�5�\��@0�	�w��@2[�A;.@3����}�@5��G�}@7VάÈ0@9il<��@:�_%�/�@<�t���@>�r��i�@@X�0�t@A[.꾌�@Bc�1MX@Cr��H��@D���e�@E�p�E�k@F��*@G�o��j�@I\��@JG*z�(@K~\.��@L���+�@M���r�@ODb�;*�@PHz�``@P�Z	�:�@Q��V�b@RJ�w ��@R�.B��@S��/�@Tcq��@U4v�8@U�Y�n@V��
���@WP��H�S@X�r�-�@X�B�@Y��"`�@Zbل�=�@[,�rƎ@[�C�TC�@\ǹ��_@]�R����@^k
V��@_?�7���        ?�mo��J�?͉t^-�?�2���M?��eT��m?�f����?��U����@I�1O'�@�~�r�@��ƧB@᎙�@�|��L@��V1�@ȹmWx@!��g��@$��f@&�e�ê@)7���@+�p�Z��@.�)��|@0�	�	@2���0@4#��Pw@5ѳ��j�@7�)� �@9X��V�$@;1!�e�@=9�hf�@?
�zb�@@��:r��@A��B=@B�K���@C��L�@Dǥ�Gx�@E箢�9�@Għ��@H9Ӛ0�@IkɃ�@J��sV�?@K�!�
�@M$^���@Nm:�׈�@O��.x@P�Ɔ���@Q4p�'��@Q��hH��@R��i�B@SJb˸$@T�aY��@T�T�
35@Uw��xq@V6g���@V��O�@W�`&�.�@X����|@YJ��Q@Z��K@Z�7V���@[��J��-@\��q�8w@]W��z܈@^.3�N+@_�(��@_�����        ?�8�-s?�n��y�?���@�D?�4���@ �Y�G�@�"�x�K@�|&�@Pc�ӗL@~���@*<<J��@!Z��\��@$Q�A�@'v� ��@*�M�Q�E@.D��Q�@0�.V�M@2ٶ�-(@4���.�6@6�'�ϫ@8�Τqy@;$Q�p@=a.��@?���@"\@A��d'@B:�.O�K@Cw��WȤ@D���{�@F�k���@GXm�=��@H����@J�`
@Ku��u.�@L�o�E�@NS�l�6@O���n��@P�Ǚ��@Qg@_�k�@R,aa �v@R�lDH�o@S�T��C�@T��2p�@U]��'�h@V0�(�M�@W���ì@W�F�r@X�o�6�3@Y�'�sͫ@Zxb���=@[[�H]�@\@3(0@]'�?�"T@^�ע��@^��}T��@_�V�D�@`n�����@`���(�@ab��T�@a�x	�q�@b[B���:@b�����@cW�+���@c��pI��@dX��I!x        ?��=�rq?�櫨��?�����/?�bY���?�6���?��-Q8%�?�T����@h:��@@O��@3�ѯ�@[gК @N`�^��@p����O@�H\KR@;��\�_@ ��T�bX@"�m�cT@$���q"�@&���uC�@)�͓��@+9����@-�v�.�@/�'�g�D@1!�i���@2__���2@3��6R�{@4� �3@6J��x�K@7�e�mc@9�%@:~��۞�@;���@=r��㮰@>�Կ,N@@B@
�	�@A:T��@A���I@G@B���cSD@C�~�=�@DW�M�@E32�`�@F$IKp�@F�x3A�@G�'�f�@H�+ι5[@I�}��V�@J��@@K����5@L���I8
@M�:�^��@N}��/�@O}%��$�@P?�z�V@P¹BV@QGK�8@Q���m�@RTT5�Gv@R�.�M1 @Sg�ǧ��@S�Q
?pX@T���݊�@UL�r�x@U�v��	�        ?���k��5?ΎI��n?��Ԅ�?�h�H7L�?�۠���?�mp�P6"@��|�i�@	P�*9�n@� G���@=�^@���~K9@gq*�@V�2��@!�x��t�@$e��2�@&���[��@)�=�y�T@,v�*e8
@/fd>��@1:U��O�@2�t�JP�@4uBڠ0�@6(v�9~@7��04�@9� �d.'@;��5m�t@=���mR@?wSE�x@@���{�@A�3�{F�@B���os@C���x�@Eu+��@F%4uC,�@GK�;D��@Hx2��I@I�L1���@J�=��F@LO��CE@Mb�+I@N�4���@O��r���@P�(�eQ�@QQ
��@Q���;��@R�q����@Scح��@T���TT@T���g�@U���Y.|@VI�i���@W�wY;@Wʒ	L@X��%x��@YT��GC�@Z8�2I@Z���S��@[�ҫ�v�@\���� 4@]U&u��@^(��?�@^�	0k��@_բ�b�        ?�� �g?�Gk��?���сz?�r�*�.�?���i	?��Q��)@�F�u��@	l���1�@���y��@T>��$�@]ʙ�@'���D@��t�d@"ɨz��@$�cҸۢ@'�@)��2�Z@,�r��<@/��&��@1W�4��'@2�T���%@4�ݍ��M@6TJ)Fr@8Y�k!@9�ΟL�?@;�kJ�@=��o_�@?�6r��@@���:��@A�����@C	���X+@D#�e��M@EDo>�?E@Fk]E�e_@G����P@H����U@J��̗�@KE+�;�@L��qĔ�@M�H!
�@O'��ɮ6@P?b��ǜ@P��Hj�@Q�w�]@RS/'�'U@S
��
�@Só��b@T�H~@U?)L�C@V ����/@V�T�%@W�\z�y�@XU���I:@Y",�[@Y��Y���@Z�#��:@[����@\l�G�@]D�S��@^�{�@^�5vx��@_�d�@`_����        ?��B�|h?ڂV��L?��^�%;?�؊ޖC@$�A�@	��<�=g@M'mK@��x�^@R dTp�@ ������@#��yZ�R@'5�la3@*���e@.���Uo@1b%3=�@3�n�Z�@5�t�PH�@8�\q�@:x��]�@<�/�O,Y@?��&��@A���e@B~��ʧ@C��h8�@E_�����@F�g؜0u@Hi�_��@I�ks닓@K�l��M@M?��pY�@N� @PTN�
�:@Q5Mm��@R���ϼ@S��'��@S�ř���@T�=�l_z@U��`��@V��sr�@W����@X�g�\@Y�M*-��@Z�,���@[�̘�p�@]�JS-�@^%Vx�T@_@"�y7�@`/��]R�@`�ߴ�v@aT#;� �@a�I�H�@b�L��:�@c)���@c��7��@dPZ���k@d��P��@e��$� :@f0��D�l@f�1h1K@gy��0e@h �cfr�@h�z�	]@it3^�W        ?��G�?ų:?�?־>���?�b� ��?�\��Xw?��ݽ��6?�c8� ;{@�8 �(@�2f���@
A���8J@*v���z@3��Sm@��"`c�@�(XC@��yo9,@*���e.@ ��<Ӷ@"zس�[�@$EVF/�@&�8�]�@(J�&�*@)�����@,nuP��@.��ZPf@0���J@104��ɲ@2L���m@3o�>S�@4�u���@5�O�� @6�w��@86p��w�@9v~ϖ@:���@<f��@=W"�Í@>�"R�)�@@�l���@@���V�@AfZz���@BFx�@BҢ���@C�gE���@DH���+@E���n@E��ڶoS@F����x@GP3-�.�@H�� Ǹ@H�xd�\@I�^�s�_@J{h{�k�@KK����c@L�k,k@L�)��!v@MȒ+�@N�TtP�@O{6QN�@P+��u2�@P�2& t�@Qb��nc@Q|�b"R@Q����        ?�A��#�&?�Z(���?�|�;;�s?��Sc2�?�k)i?���4ޑ1@bF1J�4@�X��*�@%�,[��@�� ��@��6'��@�d�Kb�@��jꯄ@!�����P@$0�Ld�@&�W��14@)k贏m@,9Q�$��@/'bsc�N@1ZF���@2�\�Q�@4Up�f��@6	VƖ�@7����X�@9������@;{��_��@=hq���@?c<SHK@@��b<�@A�>8 |�@B�}ND�@C�.w[?@E8���@F+�0��u@GU�#�v�@H�~����@I�Ē�]@J�w�Rw@L;�r�TM@M�ˤ�Z0@Nцwrp@Po�N��@P��!-�p@Qn�_�@R����@RԈ���@S��G��@TE��ۥR@U�Y��M@U��&Y�q@V�n�XV@WFl���@X�j��"@X���IΌ@Y�Z���@Zn��ߢ�@[>��!�*@\Vz�\o@\��cO@]�R�%�@^�d�t�<@_q�@`'ٻ ��        ?�(l�_|�?��'�pI}?ލ@�0I?�2*(�L�?���ӂ|*?�1.�1�@��g��@H����@P�Q[�@yy+��@�	c�@�H�m�@أ���@!Eàx�,@#�S��V�@&W��y@(� �hn@+c�a}�@.9P��wO@0�O���S@2�;߀�@3���M�@5Z��x�@7�~gO�@8β��@:�A�4�@<y?��@>b}0{Bv@@,e�� @A-���;^@B5�6�0�@CD+0���@DX��"�@Es%ǘ|@F��h�@G�M>�x@H�`��@J���|�@KP�2���@L��4��?@MѾւ}=@On��]�@P4Fꩻ@P��I�@Q�fx�;,@R9i��D�@R����p@S�4(�&@TU��}��@U/,�@U���@V�&�s�@WIт�G&@X��I@X�`m�3�@Y�6�z�,@Zdc��\@[0���{@[��pd&�@\П�8(@]��E��2@^y=�r��@_P�I�        ?����3�?�M{�y=n?��kl��?��k��?��I9%G@x?
O'�@$�6,�@AZ�8ֿ@��T0@�W�[�@!T ���@$L���I�@'t}1���@*ɴo�`0@.J1-|Q@0��$֌@2�	�E8@4�2#8�@6�����@9��ǉ3@;@����$@=��f��W@?�!��Q@ATà��@BV��EYa@C�9�p�@D����@F0����@G�.����@H�c���x@JK}�P�@K�](��P@M)����@N��[��@P0��@P�Q+�@Q��J��@Rc'�"��@S/E�$�)@S�d���@T�x>�	@U�xF�@�@V}Y�2��@WXڒ�8@X5����F@Yڒ �.@Y��A�&�@Z�|����@[��\�g@\���G�`@]�I�� @^��H���@_�P#�_@`;-�S@`��$��@a3��2j@a��]K�}@b0ʕ�A@b�*��@c2�X��W@c�b\M@d95�7��@d�+�ۼb        ?��D�=�?�L����!?�T��Tp1?�	s�K^�?��OPN�?�:�}qth?���JPq@0�4>�@O��#�@	�Օ0�#@�����@�k�@��@��;���@�s��gA@�Y���@�-s��@ �'���|@":�j�v@$p�۵@%ڶ1"�{@'�>0)@)���|@+���}l@-�Im��@/�Xѵu2@1K
I=@23幎<
@3ZcѼ�@4����٢@5��?�3@6�>X�5h@87[�[B_@9~����@:���<��@<!1
RS	@={��JL�@>܉!���@@!�pj@@�D�Z@A��c�|9@BN_�r�@C� ��'@C�P�S�{@D���o#@E]���@F(�����@F��P[�u@G�~p�4@H�炒�(@Iq�C|K@JI�]��@K%V1Ԫx@Lsj���@L�-���@M�~nW��@N�d5��@O�ܺ�8@P@s{8��@P�@euw'@Q/S;��e@Q���/ߘ@R#A�PΕ@R��R�i        ?�����H?�}��g�?��vv'�?�s�^�?�$Ud��?�pz(�>e@
叙�@�c�xS@�aS�@���qq�@QX���
@C=��@}k��uY@!��@#��jC`J@&f[��~@)�̛N@+ў��t�@.��Ǜ�@0���
�@2oqR�@4	��(@5�c��"@7}=�7 �@9IY��|@;#}���S@=p�V{�@? ��:@@��OTP!@A� ����@B���$A�@C�f���@DȌE@E��,R��@G8��c�@H>��K9�@Iq��[@@J��l��@K难H�@M. \)��@Nw�A�@O�]H?`o@P����P@Q;${<P�@Q��B��O@R��o-�@SQ�C�[@T	/��+@T���Ñw@U/�D4@V=��J�%@V���.�v@W�%�J*@X��]Y�@YO�;���@Zq��i@Z�}���@[�4iX�@\�a��(@]Y0���@^.f@��U@_���@_�
:�u        ?��1���?���5��?ގN��Z�?�7=0�4?��ո�	�?�=8	.��@�#����@X���@h]q��@���V8@*<	�_@�a9@E>��.@!]��}@#��dn/@&9l����@(�,��n�@+��<��?@.ta�"�g@0�S��h@2E{��1.@3�e"��J@5�����@7Dw90�S@9 �@:ߎ�`3K@<����<�@>��B5��@@V�(��z@A[I<x�Q@BfC���h@Cwv�> @D��`�|@E�!�]�[@F�dk�Ó@G�w&4%�@I'?��S@J[���V@K��-27@L�����@N�?�u�@Oct|�y@PY?(��-@QKm(�|@Q��5Ul@R^�c(�@S=w��@S��)=@Tz6���@U2��-e@U�9 gY@V����
@Wi�7r�@X+W���@X�ȶײ@Y��ž�@Z|�/.�@[F�;�@\��خ�@\����#@]�-,�`@^�\�6�<@_W��^j�        ?����gp�?���e�?�F�'2�?�ȩ#ղ{?���y�@P��L�/@մ���@+ ^��@�TΔ��@��ɵ]@!S�c#=�@$U^��@'�mQ��Q@*�C�v�*@.�,]^W@1!�t=#?@3�ו��@5$���cy@7E�>665@9{�RB@;��6~�@> ��yjb@@G�}#q:@A����,�@BҾ�)Rs@D%�8��J@E�7F�$@F�q��$�@HR)��cD@I�C��N�@KD��� V@L�<W�@NW�$A��@O��k@cm@PŬ�)��@Q�s���@Ro!O`��@SI��� @T(���@U
#;�I>@U��bh@Vفe�R�@WƬ��B�@X�t��@Y��H9ca@Z��h���@[� n�G@\�'�5�@]�X��b�@^���@_�3��@`]���-@`�jx�%@aoP�u�@a��2E�@b�_:�}~@c�Q�D@c��	�@d7���7L@d���0l�@e_�%f��@e�p�),@f����E#        ?�����z?ʐ���?��o��)�?�����?���&^?��Ҧ�o@ ���+@	x�C��@	�-���n@[��o�@�gF.�@�ڑZ��@��2�@A3N���@эH7�@!��7�~�@#�I��l@%�|%��@'����-�@)�S��*�@,)2` 4@.q�+z��@0e�%>�@1�QTV@2��u'�@4�N�7k@5hH�v&�@6�jf�@8&�U�@9{���I@:�a��b�@<V��ll�@=�>��@?N1Ǳ�9@@j*��(@A0G���@A��?:u�@B�y�J�@C�O���N@Di?�J��@E??8S�,@FE��@F�F�o|�@G�7��2�@H�
	+�^@I����(v@J�&J`G�@Kk_��@LXT[��.@MG���@N:W�Ji@@O/X�$k.@P}u�JS@P�� E@QcN��@Q���l�@R���e@R���D��@Sy��֬@S�=M�l@T ?���
@T���D@U/�Dx��        ?�s/��?�sI���?���j�?�T6d�|�?��V�T��?�X�FZ��@�����@	A�(@��V�Z@4)��?�@�L����@��T@Qs�~bQ@!�\k��@$f����@&�ȍ��@)�,��Q�@,���6V�@/y8;�7@1Ga��4L@2��$K�D@4��V�M%@6D�`FF@8�~6�@9�,G�E�@;�D���@=��(�UY@?�gU�@@�1�ʞ�@A��Z�[�@C	�׳�@D%�脒�@EHM^qX@Fp��p�@G�:h4j@H�ŲTA�@J�0W@KSu��h@L�r
��@M�m��6�@O=W�]�W@PK���͹@P�Y�ʽ�@Q�q�@Rc�d�@S� r1@S��r��@T��BI�@UU7:�i�@VtO��7@V�^HTy"@W��YB�I@Xr!�j�;@Y?�5�@ZV�$�@Z�O Z��@[�Ի��@\���gT@]kq�9@^H~Joh{@_(�Dq�@`���$�@`w.�^��        ?�覩G��?�X,����?����?�u��???��˃!?��S�h@�z�5V�@	g���@�����@O�m/�7@fHl´@ QS���@wW�K^@"
ؙ��3@$|�.x�@'��`�@)ƕ��`@,��W��i@/�\���@1T�t��@2�B�F��@4�R;@6Q�I� @8��%@9��6�@;�[�<��@=��*�@?ǙX��@@��B-�@A�����]@Cly��@D(�F{P�@EJ9����@FrK�o@G���R�@H�[��I�@J0��e�@KQ��_�@L�=(�s@M����u@O7�Ň�:@PH��@P�>�6��@Q�?O��@R^@��@S�T��@S�(��@T�(�Oݦ@UL���[�@Vts��@VԘ��D�@W�]��J@Xf���M�@Y3��[�@Z(Zܢ�@Z�#�]s�@[�����@\��3,�Z@]Y�S_�-@^5���	s@_�W�$@_�Z��@`k�����        ?���Z��?����tR�?�G@~�"�?�}��C@}����@���!0@�WB��@���U@�@��dcf@W���@"��g�-@%�y�@)Yi@,�U��@0i�9�Q�@2m9����@4�\�8�@6��9w@9r�dT�@;^�<ձ!@=�MX �d@@,)�5G�@Ay��F�@B���u@D2&���@E��(Y�@GW�/_@H�$X�id@J��^8"@K�aյ�7@M8�n�؊@N���@P?�Ѹ�@Q�o:�@Q�����@Rӽ�F�@S�g����@T���;��@U��ƿ�@Vx���Q@Wj�A�A<@X`f�Fz@YY��+�@ZV衮@[Uݶ`��@\Y	h�s�@]_|�3b@^i.�/�@_v"�@`C����@`̶:\X@aW�Ҕ!p@a�X	8�@br�JM�(@c��cM#@c�����'@d&�O�Z@d�7�Qi@eP�����@e���T�m@f���B�@g����@g�0:�        ?�{]���?ǘg���[?ذ�S�?�eE��?��KQ���?�C����?���OVu@�+�SE�@Y��@8���0@��#f�@�iީ�@z����@��I��@���CЄ@ $m�P@!�S�c�@#�����@%�.�p@'�G��:@)��D� @+�����3@.��.8?@0 0��:@1F,�#��@2s�._��@3�ȓo�@4�-+�Ͼ@6(Ԑ:�a@7s�uH8n@8Ő���@:x�ԗ�@;~J�粥@<����@>R=eܬ@?�$u�@@�C�y~�@A`�?z@B$/�b�@B��=���@C�x1��&@D���#�@EP�����@F#<0�@F������@G��=���@H��Fa��@I�ψ��y@Jjy���@KM�ȗ@L4���@M�Ph�@N�$���@N��D��@O�ٱ��S@Pm�s�T�@P�ӥR�"@Qe8�q��@Q��K��(@Ra��a�{@R�
)�f)@Scy�(�@S�#��|�        ?��hiw]?�?�ܯ�	?ߨ�wv�?��hb`?��pԚ�?�	;�s�'@k��k��@�0���<@*��� @��'=�@��!Ce@���em�@�,~)7@!�h�Z��@$$��B��@&�ӵ}�@)WorI�y@,!�j��@/
&����@1	a;�@2�05vw@4>=z�׉@5��C8��@7�p�r�@9{c�@;V��[ʉ@=?����@?60�y�@@�P�@A�_V���@B�Em#L@CɈ븻�@D�<�o@F��Ӎ@G.��Ŝ�@H\�p�R�@I��ת��@J�kn��,@L
\G�V@MO�,�sJ@N�ͥth@O먫��*@P�϶^w@QOT�t@Q���b�@R�{��@Si,i9{@T!��m�@T�BXΫ�@U�=Ɉ�V@V[Ӷ]�`@W `L@W���8�@X���B@Yw�~�g@ZEJшI�@[2��� @[��,��@\���`�@]��"�@^m����@_I�Ž�D@`T^���        ?�:P?̟�U�?�%�ܧ�?�ѐ@"�?�Lsj�?��/=��@�g��K@��g\�@��4�&]@ܚʡ@�{�tH@a����@k7�m�*@ �͎a�Q@#|SWU@%���7q�@(3ߪ��@*��@�$�@-^��4@0�k	:1@1���z�@3�4
=I@4��A	�G@6O�6F`�@7���Nǖ@9����8�@;~5W�}@=P���4@?/H�-��@@���Bv�@A��/~l@B�Bh�'@C�*$B�*@D��hL-@E��x�xh@F���@G�}�0�@H�/Q�~@J"��o�@KM�]$�3@L}�[<�y@M�?�5|@N�!m0@P��^�"@P�Z_���@QZm��@Q����@R�(~Ė@SR}��	@S��`�ѷ@T��^[m�@U^4�;�?@V鞳�Q@VŤaT�@W|]g��@X5���@Xﮇ@Y�91KՏ@Zj��U2�@[*��
�O@[�����@\��֩K@]v� '�        ?�Ȅ�`5?��6���N?� �Ō� ?��L�3@ Y����@fz��@ǈ���
@�g
�(@�`i}G@���͎@!��K�@$�4lϖ�@(#=ֈM@+���0@/:�� @1��j �@3�>�2�s@5����l@7�jN�7&@9�A}��@<M�9�C@>�K[h�@@��}[ަ@AؘI�@C&Y��(z@D}�˹�@Eܰ6���@GE���@H��)�ju@J/X���@K��N��@M;̭I�@N�
4:@P3��&�,@Qu,�K@Q�<��/�@R��mF>�@S�-�'��@Tn>Ǌ'@UQ��}.�@V9N��f�@W$4��z�@X����@Y���7�@Y��.�@Z�}��Z@[�{�jR�@\���d@]�;�<9@^�柢�@_����g@`�T�̅�@a�%s�@a��J�[�@b {��Jw@b��a�+�@c:#| YT@c�1ś<�@dY���w�@d�!��@e����@f�&� @f�3r���        ?�7�[�?�q�J�S�?ؑI{(�Q?����ϳ?�CB��?�A&����?����t*�@꒜�@t��mj@d��H��@ڑZFh�@��-��@���9@�#�O�\@0#<�B@ T����@"$�P|'@$<Z?"@%���5�@'��	�R@*�E�7�@,2VA7e�@.eh�Sz@0S�E��@1|J{e�@2����6�@3⸎���@5 V���=@6d�����@7����n�@9C�U1r@:Y?!?	�@;��ͷ�@=]�P�@>���#%[@?�Z��j�@@���^�e@Au+H�K@B6?�_�@B�*H|�@C��Y�vF@D�W����@EV��\�j@F%e��3@F��v�2@G���#N@H��E�-�@I{��î@JV���`�@K5��(@L�P�:(@L��9m��@Mސ��W�@NƆ�똘@O������@PN�[91�@P�(̕/@Q>���sP@Q�`e��@R3w�@R��%I�@S+���$@S���#��        ?�uǕ�k�?�G�)  ?߼'���?�#�ɔe?���vvD2?�%�����@�.�s�R@	�4@O)~�y@@M�g@� )#�5@́���h@)0J0c@!Ԛ���@$?{�_}j@&���a@)yIE�k@,F�_GwI@/4u**@1 �~�@2��ђ@4Y�壽�@6Ie2�@7���۽ @9��*�>�@;}'�,��@=iI���@?c!b�[@@�=n�]�@A��~��C@B�x7@C�ײ�P@E�I�Q@F)���h@GS���@H�mN��@I����d@J�u?ٞ�@L9���>@M�,0˝@N�;�_N{@P�ݹ�@P���َ�@Qn.�z��@R j/�Z@R�]wGn$@S� n���@TGK�w@U8qX�@U��%-6�@V�ܿ|])@WJ�w!�@X��w�@X�vRL�0@Y��q1�@Zv\��!�@[G~�!Y�@\:|�=@\����@]�]Z���@^�"/��@_��K/�@`0=�T:�        ?�6S��q?���46d?ބMy�B?�'E��q�?��$��<�?��Z�@�vi�@4EJ���@3�ʧ3@d����@��A&�!@ӥf1H�@���!/�@!*Qu{Z�@#{�U6�{@%�r��@(|>J%.n@+* h��@-��}�C�@0n�J��@1�1��W@3�_��4�@5.�@6�\����@8��9���@:G�^g�@<�㩋�@=�S8*�@?��q��@@�����2@A�aL��@B��x�@D�M��@E��l�@F-�O��_@GKɇ��g@Ho!�F�<@I��%��@J��P� @K�
�L�+@M1c�s@Nn̖�K�@O�5��G@P|F�t�@Q"`V�U@Q���h�]@Ru��
�%@S"��S��@S҄v|za@T�Vן1@U8g�:xR@U�8p��@V�)o��@Wa�bsE@X�ӑ06@X�Y�GC@Y�;���@Za%�j�J@[&:X`R@[��g��@\��5y�}@]���ޑ@^M2dX�^        ?�L �/fq?�6�\Zx>?�;���?���Q6;@:��]P�@E*<�e@2�q�1@���Dp1@���WE�@_+NL��@"��\!@%ۤ��@)>�K���@,��ƒ@0IvPc��@2@*c��7@4L*�A]@6l�2���@8�&~��Z@:�ּU�S@=C6��@?���A�@A����G@B^�qvc�@C����i�@E0��j2@Fg�E�~�@G��Cއ@I?��,@J�����M@L6��K�@M�!�}҃@OJ�+�F�@Po�s�M'@Q=���'�@Rۛ�2@R���?�@S����3@T�d���@Uvni}�@VWф՝�@W<���@X$��9�@Y�+��@Y���@Z�C1{@[⊞�A�@\�5��(8@]ү���@^��;^6�@_��z�i�@`g�ܓ�*@`��Z�!@amma�I^@a�5Gzd@bxE��Oi@b�����@c�-�q1@d�Ê�X@d�gh��@e)6����@e�����@fE!�)��        ?������?��e��!R?����&�?�r��sW�?� XN�m?�ň���7?��8��d@���21;@�|y4�@�]�[�&@�aZ���@d!~}@`b�#*�@�O䊨�@�Ds��,@ 'd=T<%@!�E�F�@#׬v�@%���d@'��o�"@)����X<@,N��@.C��<@0D�B�3g@1o��o�G@2�z�j�[@3ܒ�L%�@5���X�@6f�@'C@7��1er@9��*~@:iє�^@;Ϳ�/(�@=8B} �]@>�@�Be@@Q�p�a@@�)���@A�׊\D@BV!��@C,&��y@C�0�Y/@D�#��d�@E�����W@F[�Z�@G2&=S^Z@HjfNxl@H�l�z�@I�%d��@J���k�9@K������@Lr=����@M[{����@NGH (��@O5��[�F@P9�u�W@P��;�)�@Q��@��@Q��o9	@R5i3>�@R�!��5@R�cbz=]@S�9�L�O@T6�5'$        ?��+���?�`8��%?��z�bd?�S�Ə�?���muZ?�D�X�bi@�Ig��@Sm�tЛ@[a�f�[@~DX:@U���@�ju��z@";^y@!F����H@#�滌l�@&#Ô��@(��k.�m@+a��m�b@.5�Y�.T@0�����'@2ۖ�
�@3�o�ޟV@5TDq�x@7[�ݷ�@8�3ՅO#@:�P��m�@<iu%�*�@>Og`z��@@ ���/�@A m����@B%��\��@C1���*@DB��Z�@EZ;��@FwA3���@G��h)�@H�El3@I�"��ͱ@K#|o��@L\B/݀�@M�d��:0@N�Ԥ�b�@PAI��@P�/�F|@Qc����@R��}�?@R�4/U�@So2�bX~@T"�����@T؇q��@U���O98@VKb�uE@W���v�@W����@X���`��@YM��er@Z�y\qE@Z�v�OkD@[�;>+�`@\t4��@]C^�e�g@^�7��k@^�-RE�        ?�5��?�0���K?ޘ��a�?�8�<?��p�%��?�/s�C@����|n@=z��A@<�X#=@h�0�@�H_f��@�3:�5o@��@�H@!%Z�g~�@#s�"l�@%�%��j~@(l� �@+�(n�@-��+6�T@0_ʥu.@1�s�@3jT�/�@5�&u!6@6����v�@8]⒝X�@:�е4�@;����I�@=��#�@?�0h��S@@�є��@Aȹ�@B� Ѣ�@C�%p��@D����@E�İ��/@G9�*D@H0 �J��@IT�s#@J}9�Y�@K�����@L�⪗��@N6ٻ�@OTt���@PKF�d��@P�Fr��@Q�����@R<���@R�*^Jb�@S����@TB�U��@T�(xU@U��>��@V]%���@Wٖ�^@WΧVyǗ@X��	�g�@YHy2�)@Zr��_�@Z�q���@[�qFoZ�@\Tm%�%�@]a@��@]�H�ަ�        ?���PO{C?ؔ�zo�?��P���<?�L����@ �� �de@���Np@�`�g�@I����@@�����@����v@"D<�W��@%g9M�*f@(��I�-@,CB�å@/��!]»@1��S�@3�л��@6�{�@8=9�HEH@:��Pk�@<���B�@?>w�z~v@@�}Y�Q�@B"�a�j�@Cq<b��@D�Pجr@F'��1�@G��k:�@H�)�/\�@Ju`�'@K�kg:@My\{_��@Ou�q@PMY���@Q�����@Q��X��@R��UG�@S�np��&@Ts��X��@UR��`@V3����H@W|?�x�@X o���@X�{X۰�@Yٖ�]@Zʷv� �@[�����@\��=�a@]����7"@^������@_���t�@`W��$g@`�r��Q�@a^�m��@a�!!�_@bj��sl�@b�4%���@c|�eI@d�)�x�@d��%Ü�@e!S�:X[@e�xu�@f@#��em        ?�����,?�����?�9�:�?�{JX+?�@v�<��?��&�3��?�>�Jm��@M�q��Z@�^��x@��,�K@"��r�D@�2E� �@��:��@7畦v_@�g��TR@ ����xy@"Y@�>�@$<��>@&1�ŵ�@(7��tG@*N2z��A@,t���@.�І�6�@0x'��@1�fr�X"@2���Tٛ@4�2�@5L�x��@6���`�@7�m�rm@95���<@:�:	���@;�ȁ~�@=[i�jj@>�3�%<L@@���<�@@�k���@A�C���@Bb-\��@C)��@C�� ��@D�����@E�o$<�@Fa�#	Ԟ@G7����@H��o@@H�"�UY@I��!��@J��T���@K�aM��@Ln{[w@MV"Xcr@N@Nբ9w@O,����@P��;�@P�ٕ��6@Q �T�@Q|'˴�@Q�r�@Rv�GG@R�Ƈ��5@St���Q?@S�Ⱥ�_�        ?��&�k�?͂bd_��?�����?�z;l=?�&�/­?�n��R��@���@u����@��T0��@�#�{�@3�<��@�)1� @C<�r�G@!X�p�@#�Q��J@&(��ȗ@(��ƫ�@+t�W�a�@.G��벖@0�/2��J@2"��c5�@3�o�qO}@5Y�bMv�@7	�I��S@8�'t��;@:���;�X@<h��ͼ�@>L��^@@j=6չ@A�ʕC�@B �7m*@C*�9d�@D:��L�f@EPB���@Fk`�=�@G��j�F#@H����@I�`�*&O@K�9J��@LC�Y!@M~����0@N�r�l@P�w'�T@P�ue�z�@QM����@Q�R�=@R�Jy�v@SQ�{��@T%�:k�@T�����@Uj_'@V!F%S4@@Vڮ�r�R@W�:�>ey@XS�&�5�@Y�T���@Y�uz�6@Z�Q�*!@[_2�f0'@\'�h�$@\��)��@]��,�[�@^�w
��:        ?�ѲP��?�+�DՖ�?���孉�?�S�d/6?���Ѽ?�j�Eb�j@�v�pc@	Xr���@�����@H�0�@.T�-@j��@v�[oL@"�,�0@$����[@'T���@)��kae_@,��6�|3@/��#�W�@1\R��Z�@2�e0��-@4��0%P3@6^]�M��@8'�f�+@9����O@;�Ocf!@=��\�3@?ݡ���@@�
F-@f@B��Tp@C�r�
�@D8!{��@EZ�K+ @F�9�#@G��i�$@H頤<(@J%��/,e@Kg��p$@L����{@M��Cd�@OQ��O`�@PU�S��v@Q����@Q�k�k|W@Rm��	�@S&DvD6�@S�_8��}@T�9��L@U_��L��@V# �M~@V���k@W���Y.�@X|�8�@YJ[��u@Z�M�a@Z�`=�:@[¤N�@\�bb��@]t��%]�@^Q5R*G�@_0>PS�x@`�Mi$@`z����        ?��;�C�?��!���?�A��w��?�w]���@�	>\@Y���6@��Q��@���-j�@��`&j)@#���@w@"��9^@%�Ovi�5@)����@,�X�2�@0.�0�,@2#��{3�@4-��i�@6Lw5F@8g濐@:����1�@=@jy@?��} ?@Au��bJ@BL +
WA@C�U��i�@D�� ?�3@FU����@G�N��}@I.�L�H@J�'4��@L&��~	�@M�#���@O<�~	f@PiM �@Q7���Z@R	����@R�nv��@S�m�(�}@T��N20@Ut�3�3@VW{5-�@W=��ݷ@X&��y�@Yp{��J@Z󤨄�@Z�~oru�@[�d�q�@\�j$�
@]�����@^�K`s�@_ނ9F��@`qH_%%D@`��X�/�@ay�sa7@a��#�>@b�Nm$GQ@c7"��@c�t1�/@d&4g�/@d�ڷ�d4@e@�|���@e�g ,��@faSs�2        ?�D����K?ƶ95aj�?����U0Y?�R�}*s?�ΩҌ�?��+��?���B��5@h�#]@�l@�g@�߻���@o����@60�@(ذi�(@E$��@�n�[@�B	QC�@!�&�r3�@#�/
t%F@%��<���@'�9����@)�P� <�@+���a_@-ۓ��K@0<m0V@11ƾ�p�@2^�1U�>@3�Y�f]@4�܅�@6WD�%@7Z����@8��L:^�@:_A���@;^����R@<�4T��K@>,0p8u�@?�rb�c@@�s~	\@AG��!�|@B	����@B�^(F[Y@C��@�i@@D^��Es@E+�d�қ@E�����@F���{�@G�d�9��@H|��>�&@IW��~�@J5�K�Y�@K)>8��@K�6�DJ@L����N@M���d��@N��܅�@O��� �3@PG1}9Q@P�5�n��@Q:o�ѓ@Q��.��@R2~����@R�O`w�@S/M�ш�@S�v��#�        ?�OՄ3�?�O~�T?ߕ�Đ.�?�A���?��xb??�O�En@l_�N�@��l��}@/u��@���t�@�(L�P�@�s��iL@����MD@!�~4ǟ�@$*�+:� @&��^E@i@)_a��5@,)wH�W@/DEb�%@1��q;>@2�G���@4Cs�K��@5�* �.@7�)E�f@9�0d���@;Z���@=CT��)@?8�n�D@@��9���@A�����@B���-�0@Cǻʈ��@D���;�@F0N�oR@G(:�'@HT�(�b@I�l%d[�@J�a2�E@K��0�@M:�Yʍ�@N���^.�@O��q��x@P��}��L@Q:�@C�:@Q�N@��c@R�^�Bώ@SJ�꫅@S��21g�@T��m��@Upn���@V,DŅ��@V�c8�E@W���� @Xm_�"�@Y2/~�`.@Y�,@���@Z�O���@[��;��p@\Z�82�W@]*k�w��@]��8y�q@^�s�N��@_�����        ?����)?��u>�qY?߀���*m?����?�����'?� ^���g@��	ySj@	�z��C@^����4@ S?�@�)@Y@�r��U@=��2C@!����@$^]4o@&���ګ@)�T��F@,}�3��@/t<Q��|@1EK���^@2�ĥ�@4�gSI@6C6Ӱ��@8���c@9�zf�@;�Ch@�	@=����@?�·��@@����@A���'�@CyŠ�>@D!�X8@ECxr�]@Fk�1/@G�Y:h��@H��j��@J�}���@KI�V��@L��s*/�@MݔO�@O0z�ר�@PD���@P��@Ǌ@Q�h̦@R[r`�I@S�`��@S�m�L��@T�Á�V�@UJӅh @V�z2W@V�����@W�}�@Xe�E��/@Y3KF�g@Z�]0��@Z�[��+�@[�>Q�_@\��H)7@][i(}-�@^7��.@_J��N@_�R���>@`m\gq��        ?�=NO���?�m�0�C]?��B��?�菱�@ �?uZ@@�5�2�@����%@@�c6K@8
 �3@�]>�@"B|Q��t@%g�?wڱ@(��n��U@,J�T~�@0Yg�@1���r�@4 
V^@6o�$W@8S�Z�'�@:�7�yb�@<��^`�2@?hX|��@@�?���C@B?�zgM@C�x_L8@D�ab~|@FTQM ��@G��~E-@I7�ҁ�@J�z*"C�@L;� jz�@M�u�f@O_<��.@P~\�xϙ@QP��9�@R'5��,@S4 Î)@S��~��@T�T.@U��M��@V�P��5A@Wy)���@Xhr��@Y[ ^5х@ZQ&�Dt�@[JzmRI�@\G|t�7@]F݄Z	a@^I��BcM@_O��R�@`,�H��@`��vO��@a:<b"Z�@a�K����@bM�V��)@b��5ժ#@cg��@c��H
;@d�	�!W�@e�	G�@e�y]Hd&@f>��er�@f�L��L        ?�.��v�%?ž�x�V?��M~A?�s^�Jd?�jwְ?���G5��?����{��@���Y��@����@
�	L7W@�~kٶ@~�w��S@W��`�@Y.���q@��ay-@��y�@!mԸK�@"�#<}4@$âl�7m@&�i�Sm@(� [�@*��m�@,���uPK@.�S�k�k@0���6��@1�E	��(@2��w}�@4�)��@5C���e�@6�/�@@7����O�@9
��c
@:X`��-@;���p�@=��(�@>fd�p�@?˲ϒ/�@@�<����@ASP�:@Bf�}�@B�g�b@C�X����@DM���@E���@E�c� ��@F�X~�u�@Gp�NQw�@H?x3�J@I�\�	@I��2 �@J���f�`@K�����@Lk����e@MG�2���@N&o�q�@O�M|�@O�O�(�@Pg2�\9X@Pڔ�ް�@QN�㣹�@Q�U���\@R:���E@R��-��        ?�gG�m?�-�+��?ߢNz���?�jOD�?��)Ӎ?���T/z@x_k�f�@	�H}�@I&X�@^�Q��@�pv��@Ь5�9j@,�۷�@!ڟ^�@$H���7V@&���xu�@)���CK@,]ٽ�
�@/Q+=!�'@12&��@2�[/�A�@4s�?�Bd@6+�{�8@7�I�I�]@9ǖ]���@;�WWJ��@=�V�,�@?�`>Al�@@բ��p�@A�k3���@B����@D!����@E4���w#@F]K7_�@G���g/@H����,q@I��,���@K=$AR@L��o	@M�\���@O%p>��c@P?_�Fҷ@P��5�lA@Q�g�S�@RV� h@S�_�]R@S��2<n@T����f�@UG��k�@V�w�}@V����@W�i�Q� @Xd����W@Y23w~F�@Zt��" @Z�@�'X@[��`���@\�[ٙ}@]\�~�&�@^9T��P@_vʹ��@_� a���@`n�4ܙ        ?�>��&�?�(�k�^?��ѩe�?�d��c@?�S�o�i?�e��X�b@I8�@sQ�
��@������@�s���@4�o�O�@��U�~@FL��b@!Z�Sq�m@#���z&@&+8�^j@(��[P��@+y4e�q@.M��џ@0��Ub�@2'�l�@3��&ie�@5`<�'@7}�3��@8�6i�k@:�+1i4�@<u%�T@>Z���x@@&���i@A&�ϏE@B+��2@C7�E-
@DH��_�u@E_ȝ[�@F|����&@G�x���@HǹރcJ@I�zyh�}@K(����J@La*���@M���@N��cjZ,@P��S`@P����T�@Qd����`@R:�ne@R�3_�@Sn���9@T!T�3�@T�oΫՈ@U��� &N@VG�|m�@W�G�j@W��+@X�[!\@YE� i@Z	���*@Z���~�T@[�!:_�@\ei��'�@]2�׾�@^<�b�K@^Ӿ��/�        ?��z���?׸6k��?��	���^?�Q��Q�@ 6\�c#�@��~�o6@�ΪOQ�@��&>�@Y�wX�@���&�@!�fD׌@$�L�@'�Y�Oc@+4f~��^@.�|�>@1=��>x@3.14L�$@52��W�y@7J"���@9t-QSH`@;�0m��i@=��1�#@@.�R
2@Ae��\1@B��>�<@C�}B@E;�����@F�M9�,�@G�J��7@IU{"K�@J��Kc�@L4��_��@M����-^@O/�`ͤ�@P[n�-�@Q"D���@Q�Ew:"@R�d}0r�@S��	 ��@T\��A@U2�����@Vj3פ@V��@W��o�G4@X�����&@Y���&��@Zt&��'@[]Щ�X@\J8Ԁ�@]9:���@^*ˊ��m@_��[J@`
�iڮc@`�9�� @a�i��@a���#5@b�E1�@b�'�%*Y@c��r��@c���l�@d�Rzr,@d�w����@eS窘�        ?��7�Zo�?�0���3?�M���?䶋���?�\��NȢ?���Yi?�6�$k,@�����j@�$ہ5@�`>U0�@��Cn>@Q6�6�=@>9Bw@S.���@���O�@��֋��@!���ٽ�@#�WX�@%q�i�w�@'fw��4@)k~8ܖ@+�<Z�c@-�Rv��@/�gM��d@1�BY�@24�`�O@3c��]�=@4�?U�^�@5�h��"@7`��z4@8fL $k@9�b6n�@;9#��^@<mz(���@=��C@?<�k�3�@@V���@A/RO�f@AЊF�II@B��6�ֶ@CU�r�A@D '�ߺ@D�յ/ߐ@E�q�L�@F�����w@GT�pY�@H)�i�@I �넑L@I����@J�t�/@K��)l-@Lx �rM�@M\1nӅ#@NB����@O+�@�^�@Pu���i@P�I�iV@P�G��$@Qsl�M�6@Q��>��@Ri$�`k@R��Џ/@Sc[��O        ?�oS��6&?�@N^��?߷�_f"?�"wK?����Ɨ�?�*���{�@�&Ļ#�@	!�ğ��@b���@"���^@���@�P�˙Z@C� �@!���b�@$cc8��8@&�����@)��+p@,�̓��L@/�5h�g�@1M��e^@2�p���@4����\�@6Q���@8[!
^�@9��'��t@;�d��^@=Ӌ�D@?��6⮰@@� k�Gl@B��T��@C��]PN@D9��r�@E\��3)c@F�b ���@G�6UQ��@H�\�pg6@J,�,`��@KpK*��^@L��=b �@N	�]M�`@O_	��@P]4�?��@Q����@Q�6��p�@Rwy��y�@S0����@S�`���@T���{��@UlG��F�@V0N%���@V�d�Z�@W�i�\�v@X�w	Xa
@Y[)���F@Z,|���3@[ k്C@[��^3��@\���U@]����.(@^i�
�{@_J����#@`�;~�@`����3�        ?�XObQ�?�F��D��?��8١A?�x��\a?�)�y�=?�v��ֆE@���b@�\�=@�k���@����{@Bf���p@,x�Ul@] �|��@!iG�d�@#ō:Դ�@&B��C�r@(߾:�#K@+�F�gK`@.w��Z&�@0���/1�@2D�5�@3��@5�gݜK(@7<���5@9 �yu1z@:�?��&_@<��eh{@>���ZA�@@J�Ϥi�@AM}��&@BV`2B1(@Ce`�%��@DziIK�@E�cP��@F�97��@G��5h�@I	"s�@J;�6�~@Kr�"�RB@L�t@d��@M����@O9s����@PC.qw��@P�9��jo@Q����@RE�8�V{@R���d�@S���k��@T_Hn�@U⾡��@U��I�@V������@WL\�AY�@Xe�
�@XШE�h@Y����@Z]�ƪ�6@['�A��N@[�f"��7@\�c�X�	@]�s�r^�@^c�c�P�@_7��42�        ?��&�(ٞ?ج�d)?��7B��?�0��H �@ �8���@�]���@�]���@f��ש@g,����@�oa~Wz@"ew��@%���T%@(�od�H@,�i2�x@0#��SJ�@27��y@4-I�PM@6S��PlN@8�^��k@:�F��@=E�����@?�X�@A&J�<o�@Bv��B@C�'��@E3�E�H@F�����@H�'`}�@I�Jl��@Kl��>�@L�u�@N<�ۢ�Y@O�	Ό=�@P���g��@Q�&�]@Rt�g�9@SS�pE�@T6�Ø��@U�+f�@V%�@V�3�)_�@W��v��@X��B�+@Y՝�#�'@ZѲ�x4K@[�0_C^@\���}�@]�A)"�E@^��6��X@_�~�*n�@`�8��@a	�G)@a�����F@b!�up�@b���c[D@c?r�S��@cЧ�N��@dcY��@d�����@e�)~	�@f$D�=��@f��?�#y@gVԾkHn        ?���6�J?��7�c�?ז%o1?���=�-?�w�!r:�?�`��*��?�n,��UQ@+�.���@�9�0Q
@GKUd��@2�SA@�v'��@������@��g�N@�uX@{'�M&@!��9��@#T���F9@%;�9Z@'3��:h@)<�h�V�@+V̿�Tk@-��Q�9@/�s��@1i�o��@2.�ư�@3cFxj�@4��g���@5�V��:@7+@�T�@8|0l�M@9�	�Ol8@;2��@<�oYo�@>��kC@?v���P@@w�/�@A7��.E@A�����@B�����@C��`|�@DV���@E%U�:;@E��5�S@F̶@�0�@G���B�@H�)�}@I]fl��@J=�/aפ@K!O���@Lj��Fv@L�?�t@M��o#�E@N�\0�Q@O���wp�@PWA���0@P�a�<��@QN���Y}@Q̠*��@RK����f@R�.f-��@SM��+@S�Йь        ?��h��@?Σ�\E?��M�?�u���<�?�旛?�?���B?�@��P��I@	g7O�@M@���k.@T�p�;�@�;i}@1�;B'@�B�_o�@"�Pd�@$�q�0q�@'0���t3@)�\(ai@,�����@/�v�q�@1yM;T�T@3}�%V@4ˉ�ijB@6�1)0@8\9�!�@:;g2>5)@<)���@>&P���@@ϖ!�<@A%�!Yؼ@B9tVj�?@CT>���U@Duᵞ)b@E�E��@F�S7R�@H�7�@@I?�fmE@J���/r@K�W���~@M`��x�@Nn���s@O�٧�B�@P���F,5@QI*�I@Q��4N!@R����@Sua�	�<@T4|cD#�@T�dP��8@U��MH3@V��r��"@WL���g@X���@X���\�@Y�D�'K�@Z���=#@[g�=N�&@\A�L�1%@]/g�H@]�[��7@^��H?@_�MFX�@`U0�z@`ɠR��        ?�{$�lq2?͏���`]?�4
/��?����~�?�c��?��z� ��@F/��!�@�Ɠ/ �@�0gXP�@޵��d�@��T��@�'�9}�@�k����@!��h���@$ť&�@&��H/�@)>M��ղ@,:��@.Kp@0��<b�@2��c�H7@40��i�@5�Zj�i@7������@9nV���@;I���^�@=2���-@?)���$�@@��R�@A�����/@B��*��@C�z��>@D�^SvN@Fy�r��@G*�5�!"@HX�(�.@I�@�nnU@J�h}!l�@Lci^@MM%�J@N����*@O鈝)��@P�W-=@QNeB @Q���~�@R�%S�@Sh%��X6@T ���@T��z��@U���n@VY���%@WO��@W�[L؝@X���"�?@Yr��L9�@Z>��K@[E_��@[���E�@\�^�4*@]�b� P�@^]��)�@_7�@`	�k��        ?���9s(�?������?�CU�7�?�zE��z@���@�R�v-@���{�@�h� c@��#0f�@`���?@"����kj@%���|t/@)h�3��@-��h�@0w�8:��@2~�
��[@4�.'�1�@6��4L��@9"$�$�d@;����)@=���t@@F�9P�@A����*@B􆑝��@DZ}���w@E�Oi�@GCЏ@@H��-�X:@JS?
>@K����sf@M��8�oF@O/4"r�@Po��$��@QL^'�@R-3a��@SB��{J@S�a�I�@T�����{@U�V)�ze@V��?@W�_�~H�@X���F��@Y�D���M@Z͎�z@[֯��9@\㜠�M@]�J+���@_�.3��@`_���@`�7�0u�@a-ݠ ;	@a�L?T��@bR�[��@b�v(D��@c~)�-�>@d�~@d��;ĕ@eL�ƌ�`@e�$A�9�@f�b�\q�@g*O1�}@g���MO@hq*�aj^        ?�e�&L�?��V�}�?���LZ?��=�S�?���)<�?�C�:��?�*�?�@�U��;�@NL����@`Y�-�@:�p@��sP��@�3�7ƨ@�*�
8@#\��i@m��W%G@!z,���@#Of�o�@%6$�S�@'-���d�@)6����@+Nf����@-vm��M�@/���ǝk@0���@2$��Tqv@3VO���@4��m#Z@5���7�D@7D�K�@8bk�a)�@9�W|۟@;@hEKq@<p��m&@=�mk"�@?DH�"NK@@[����$@A�>�(@A�fI-��@B�����c@C^�5�T@D&�O��@D�i���@E�ޥ8�`@F��p%@Ga�-Řp@H7Ul2W@Ih X��@I��L�@J�:��@K���I@L�G@Mm���@NT�[�{ @O=�Y���@P�>U"/@P����:@Q�#N>@Q}+�x�@Q�M	xc@Rr�h�@R���1�@SlL���        ?��y�)��?͋�	 �?��͋?ꋚ�i�R?�6/J�8�?��b��Z�@%���@���y��@����M@��Ne@Qs�#@=��/�@p�,���@!t'��{�@#�Yn�B@&O&���@(��d�~@+��Y��+@.�*�ͤ@0�FQ��N@2J����9@3�e1��@5�FCLPw@7B

4@9^��|u@:����"@<�ކ�e�@>����~@@J�GZ}�@AL���O@BT�����@Cb~6��[@Dv>�Q73@E��$���@F���"��@G��L�j@H�(��@J-��ӫ�@Kc0Vx@L�t��#�@M�=�@O!���V@P5�:�yr@P��1�@Q�܃�;@R3�)��@R�痳�@S�i�$]�@TE�R^��@T��Q���@U�����@VlW�� �@W(EHC�#@W�Nj'��@X�i�gv@Yh�KRb�@Z,�b��@Z��ZѾS@[��V��@\��!��^@]P�ʶ�@^EBg@^�.�        ?�ܻ��+#?�C�]M�?��遳�%?�o��Z?���+��?��*k"�N@��	Mm@	�^�{ @�?ro|�@n�� �@=�}�L�@Y�Ч�
@����v@"8wT�[@$�NiXP-@'Sa���@*��uF@,��R7[�@/�Ҹ��@1��B�@30=�@4�SU���@6�����@8q�{�@:OX\�@<;�V"@>6qD��q@@�u�R�@A*�I��@B<���.@CU�'���@Dt�"�ul@E���*�B@Fƛ]���@G���q�@I1^�2�@Jo�|6
@K���mI@L��aU�@NOj6<,r@O���컦@P���-� @Q1y����@Q��p�# @R�=_��@ST0[@T�PCAS@T�	b�^k@U��m�n�@VRB�R˓@W-���@W���ʫ@X�y�a��@Yx�21��@ZH��F��@[��'[�@[��i��@\��J�@]� os1�@^z\�8@�@_W�p�k]@`�a��@`��|tU�        ?������?���aQ?�OeG~�?�����@ }t��@?�|L�@�n#�z@�ҜvN@կ^!/@-��q$@!�e�A@%`�G2g@(\|�`�@+֌��E�@/~���_I@1�u�{t@3��,ƻx@5��[�@7�9f�AZ@: �bUJ�@<oL�jV@>�=@�/�@@��a�@A����0@C.�uj�s@D��<0&@E�o�9�c@G@���� @H�x�JA�@J�Ը\@@K��w/�@M��L~@N����?@P�pZ�@P����3�@Q��!+R@R��G�	�@Sa��_@T:�R$��@U���@U�X)˺@V��P}J�@W�ǟ��@X��)2�;@Y��_��P@Z�#x8@[}:$W��@\sr���@]l���w@^h�șHy@_g��OJ.@`4�BQN@`�h;4|@a:�&k+�@a���X��@bF���E@bͲ����@cV�/�5�@c����@dl<o��s@d�� d��@e��tcj�@f���4R        ?�#h�x�?����6�?�f.���?�%�M�v�?����m?�[!1�^j?��O����@�˧�M)@V�w�@]V3�G@a
b��@@���u@I�,�?+@|\�7�]@�|*Ͼ�@ �]����@"}��(jv@$b`j'��@&X3>l@(^�z]h@*vJ&��@,���`�@.�A�e��@0�#��z@1�Re� b@2�rRǑ@4&*z	�@5g��&��@6��q3@7�u�z�I@9U�� �@:�ò���@<gTH�@=��s���@>�(:[@@4���_@@�qO	@A�KHS�L@Bx�Ͷ�t@C@�t�@D<Y�G{@Dع����@E�!s��@F|.��9�@GR�U��@H*�E~W@I �l@I�;��T�@J��n��@K�~��hm@L���+��@Mw@X�O�@Nbu��е@OP*���@P )�%\@P�te�	G@Q�5.@Q�����@Rs��p@R�r���@@S	�6"@S�ޗG~@TF.9&�        ?��@�G�(?�WU'�@?�ʚ�\�D?�̪'�x?��4*���?�ֈ���T@�kD�ِ@
����lR@�{z�'�@2���)@%"6�l=@g4�ߗ@ {b�T7@"��B��@%{�@�-@(2��@+��2��@.
��H�@0�P�mie@25���E@3��?��@5�kAƴ@7y��ڴ�@9Z�]Xk�@;Kf-v��@=K<�v҂@?Z/�)�@@�����U@A�L�]�@B�o�.��@D����m@E?P�ʧ�@Fq�\{��@G���=:�@H�bM��@J0��	!@K}��@L�>1�A@N*�5�L@O�Ę��@Px�6��@Q.�~�,@Q�$��V3@R�p�rP@Sc��p�!@T%���@T�/~�@U�!�$H@V}��� �@WK�nv�@X�+�v@X�Fq�1r@Y�&�G�U@Z�� ^�&@[x���@\V�U�-�@]6�a@^�Ƞ�@^�?��S�@_�҄y�@`h�Z\(@`�M(@aV�d�,�        ?��{jc�?�Yh�o��?�ܨV�?�"	�J�?�w�ڏ1_?�v�W��@\�
8��@���f�@n�] @���4@b�b�I/@(��`@9"�@ �~���@"�R7�@�@%G:�F�@'�jH�a1@*V��3'@-�����@/�NB�ɶ@1]�"�i@2�A6��G@4knz��@6���@7����@9[���#@;�3�@<�7hl(@>��_���@@I`H.۬@A=��� @B7sˤ��@C6<Y�@D:��v\@EB�X ��@FPy5�-�@Gb���@Hz	�"@I��|�ړ@J�BaZ"@K�&�ɭT@Mz!��@N2*6Ũ@Od#�~�
@PM)�j�B@P�R��0@Q��뢲 @R*�����@R�〆@Sr��;�4@T\���@T���T�@Um����@V!lI`�@V�i1J@Wxm{���@X*'QU�@XݏR��>@Y��:|N>@ZIM�l�p@[��2Bl@[�w8��@\v妼��        ?������?���~]�?���!�i?�LY��J�@ �Z�O��@尐Ʉ@�7��/v@z�2��@}����!@�2mҵ@"p�J���@%�.���@(������@,�4P�@0%��}T�@2kA<%D@4)��{@6LF��g@8��hD�D@:��9#q@=0$!d?�@?����ͷ@Al`{@Ba�
aQ@C�:d�;@E9Y�f@F}�u��M@G��4g�@Ifz3d@J�f
���@Lp{[3�@N��y��@O�����M@P��SX�j@Qq��ը�@RI���P�@S%��?@T5��� @T��@U����U@V����|A@W��!6a@X��(\��@Y��Z"T�@Z~w���}@[x��  z@\u��AD�@]v�5�)�@^z8���@_� US\@`Em<�C�@`���#�@aSҫ�^_@a�@[Y�@bh#�Z�@b�w��i@c�8 ��g@d_���@d��nH�@e3�k�
@e���@f[�:��.@f�W���        ?�7��tR?�E j��?ا�}�_�?�}P�#?����]�?�\�j�e?���n���@�t9@���:��@���;@�Z{�~@�vs4��@���M6�@)/��@����c@ �νݙ8@"k��BF�@$[��X'@&^�wt׆@(th���@*�Q!9�f@,�u��\@/!o�<<@0��L�a@1���Ae�@34��R=�@4{�j�=@5��r�X@7!�Hi�@8��<�*@9�,�u�@;U5�;�0@<ʴ��*@>G�����@?˲Q�O@@�~c�u�@At���y @BAW� n@CtG>�O@C��9�|�@D�ќ�w@E�����X@Fsj���@GTX�@H7�J��A@I	�x��@J	@Ar@J��!�@K�����/@L�nR�@M���@N�U]��@Oƽru�@Pc32��@P�-Rd��@Qf�ھ@Q�ȫ���@Rp=UaY@R��?:�@Sf��u@T	����@T�&�{�+@U ��d<�        ?�kc�Y�?�kU;�?��UU��?�T�����?��P��A?�^���@�F?B@	IU�i@�-]ٔU@;[?:f@�a�\@+vA�@]�|��z@!�;���@$n�0�R�@'�~��@)��<�@,�b�R}@/���,�1@1K}�O�G@2�ph�L@4��LK�6@6F�9�,@82
o@9����?�@;����F@=��Hi@?�>GEZ@@� `+U�@A�o�o6M@B�R�_a�@D��(<�@E8u�@F]�� �V@G�nMH@H�'R��{@I��Dʨ:@K0C`(�@Ls��]@M�m��k�@O
���w�@P/�*� m@P�^�"��@Q���\@R>"�� �@R�P��2@S����M�@Td�&}2�@U!w��^�@U��f�=@V���lAu@Wg)�0>@X.)x��@X��Tl�@Yó��N@Z�5xaļ@[c-08��@\6�Jt�p@]h%:@]�e/�"@^�4�A�@_�"�i�G@`=�=E�        ?���$aS�?�Bx�kR�?��R]�} ?�l�H�?"?���*4w?���#�HO@Ƃ���E@	u`��@ʦ�v�@a7:�a?@+���+u@CK�!��@�q�Ck@"(Hvۨ@$�~�Gk@'=��?ė@)�Ѫ���@,ۂ iz�@/�� !�@1~R0v�@3l��f@4���W�@6�ӕw��@8Z�s���@:7��#�@<" &.F(@>(~Ka�@@'��e{@A���S�@B,���5V@CD���Ǎ@Dc%|��@E� I<UF@F�/�W�@G��p��@I(KZ�@JYƛ4�@K�bW>�x@L��us��@N6N����@O�~��r@Ps5�u4�@Q#���@Q֢B�j�@R�����@SE6c��7@T ���@T��n��@U��Kr@VB��BO@W	й�@W��
>@X��N's@Yj�7T�@Z;iG���@[Xz��@[��`�7�@\������@]�	��g�@^r�h	%�@_R��(�@`�;~w@`��_s�V        ?��w4m?�����YQ?�O��v��?���7��@&.���t@/A!j��@)|�X+�@�p���@�c6��@q�g,�@"�;E�`@%�M�O�@)p0m�pr@-h#��@0yw1D#�@2
��O�@4�.�ق@6�5���@9��r{@;z���@=���'"@@<�]�@A�r���@B�E�i�@DG���@E�NT~@G*�x��@H�%����@J1Rne$	@K�~l�$z@M\�8�@N�Q 2�A@PU^{Mt=@Q/X���!@R��fVS@R��yZY�@S�[�=@T���#@U�f�(��@V�����w@W�C�F�@X��d�@Y����@Z�N:�`�@[�����@\����4@]��]�ѭ@^�����@_��ffW@`t�!8!@a$I%0@a�N���@b"*�D\@b������@cH�j3"�@c���%K�@dv=T�1@eU�yܾ@e���r�@fFIҚH@f�� �R@g�~6ϰ}@h$ie��        ?��Zǟ�=?���Q�?�A�fK�	?�+^�^�?�eg����?�,�/Բ?�^Z!"?@�\���@T���`�@F�X4�@��·�N@����f@�Dt��@��6,�@@Q��@ cQ�I�l@":t�g�@$$�~�@&"J��N@(2W��@*S�(�`j@,��S���@.̨�F��@0�r``J�@1��ڞ#@3 ��?�'@4D��!�@5�!�P	�@6�1!��N@8A�tO�@9��+r�[@;���/@<�5�s�@=�
so�[@?}���K@@���π@AJß0�@B8��t@B�j��@C�L��@D��n6�@EbFp��@F=��`f@GD?'ִ@G����
@H�9�ت@Iʃ{H�Q@J�M��3@K����@L�����@M�B���@N}��g��@OvϸP�@P9^�K��@P��	�@Q9W��@Q�R]�� @R>�ڗ�	@R�1f��Y@SII���@S�5��O�@TX��8'@T�J����        ?�V��^	L?�"|�*�u?ߙ����h?�	 G�g]?��o��d�?���@r�;9��@	!S��f@A����0@U��X�@�I��	�@̗��W�@L�0?G@!����t\@$F�4�C@&�J�<t[@)��H��@,[��E�@/NOe�@10>K���@2�̢6�W@4p��ϗB@6'C��@7�����@9����(	@;��ed�l@=�/s@�@?�-�@@@Ά��@A�;4.vt@B��@D���@E)�U�@FP<��@G}ei��#@H����@I����?@K*�ň�@LqA#�@M�[S�=@O�h�>@P3�x�D�@P��2J@Q��j	@RI�¾�Z@S����X@S�Y�
�@Ty�p��@U:#6hi!@U�9A���@V�
w��@W�����Y@XV�ȇ4�@Y$��=}@Y����@Z�����@[��Y��C@\wDq��@]RMG�]�@^/޷�e�@_�yeS@_�s�S�@`kā�3�        ?����?���=��?�?�!h\�?�����[�?�A��'}?�=&��b@(@Ü@	��R�r @)��q@��8s%~@��Z�`)@� vD@ ���@"s�wI@\@$��0�Y@'���@*e�]^Q�@-P�v@0.� �^�@1�Q,��-@3l(O��@5"�>V�@6�QϘ�M@8�"F٦�@:�  i�n@<�M�Jd@>����x�@@V
�گ�@Ae�ȃ�@B|�h7@C�˺;�}@D��.�@E�9@G �T.?@HW|�M�@I���Vj�@J�1�[��@L+k���@M&L���@N�S)�(@P�xc4t@P�g�QCE@Q���ƺ@R@��q��@R�����D@S���@T���
�@UF��M_�@V�a�o�@V۴��3�@W���e|�@X|�rz)�@YQ�ŷy@Z)�#��@[��!�@[⻸��#@\�r@�P%@]��%ǲ@^�f�=�@_v����@`1GU�R@`���V�@a![xd��        ?��yQ���?ُB�S�?�ހ����?��R��z@~��E @�A���@{$�Ў@*��H�@]���y@ 'Ơ�@#����@&i]����@)�y{���@-��	|��@0�C�N�@2��"�!@5��)�@7BA��y@9��1v�k@<+���#@>���_	�@@��k0�@A�Y�ɶ�@CG+u���@D��1'@F'����@G���0)n@I.k+�@J�Ɯ���@LZځ�S@M��ي�@O�[�۫@P�C �@Q���1�.@Rt�/�e�@S\��`��@TH�J�;�@U96����@V-�TRQ@W&-1��@X"�)��|@Y#'��@Z']��	*@[/~W5�f@\;i�� @]KT~�@^^r�1�@_u}J�M@`H��@`�7'�|@ah!FCՏ@a��P��@b�4̓�@c%S;��@c�#\��@dV�,\�@d�ĲN�]@e��g��@f,��?��@f��{p�@gn�z��@h�b���@h�|0fV        ?����?�W�����?�p#��QZ?�ql:?�[o�3T?�V��_?�m��A�@4U9H@��Gr�:@k
	~W(@M���@�e-F�@�8���@JƼ@b�}M c@���>�@!�3N��@#�����/@%s
7u[@'o�$J-@){��
��@+���\�@-�G$-0@/���X@1%R�֞@2Q�h)/�@3�--@WN@4����q@66M잒@7IX�%�@8� L�@9�0DJ�6@;H�֣�@<�e��D�@>Fաi5@?�9�c�@@z����@A7�_��@A��.��@B��W{�@CUju�-@DG�P�b@E<�O*Q@E�lڏJ@F�f� 7�@G�"���@H\���rX@I5�h�@J��;��@J�9Gަ�@K�j�@L�:����@M��L,^�@N��J��@Op.I�y5@P/!l��A@P�l��%/@Q ����@Q��� �@R���U@R���9�B@S@gCY�@S��\        ?��a�1�,?ͤ�\��?�!�cUe?��a�	x?�F%|*�?��p��@'ӯ	G�@��n�*@�G�d@��V��@jv�"b@]X��(@��U'�H@!��	ʬ@@#�W�R�@&pzf��@)�Y{@+֬F2#b@.��#vY@0�mԎ{ @2kw.8q�@4	"R��@5�/���@7odt-$6@97�!?��@;\[��7@<𱫠�@>�Sn#�@@o����-@At�엖@B���2�@C����u@D��nU�W@E�a715Z@F���P�d@Hw�_�4@IH�&w� @JP1@K�wN@L�X�X__@ND㮜t@O�^M�@PrXP��@Qj	I�@Q�1��Y@R~��;�1@S2�˄q,@S鎸�we@T��pU��@U^�  ��@Vf>�ѻ@V�qn��@W�����@Xh
O�k�@Y0����@Y����E�@Z���X�@[�����@\j�\�E@]?p7�^@^SGR?@^�{�o*@_����        ?��pSP}q?��}\k?ߺ���?�9a.6�?�����?�Rm�<�@�6��$@	E�ˉ�@�<���(@;{?]re@�iK�q@
�͍�D@a.z 'W@!���v�%@$qV+c�t@'4N&y@)�o\��H@,�a��/@/�m.��1@1M��$�@2�E
��<@4��j<�@6J1��@8X,���@9���ᨥ@;���i�@=���ZT@?��k��]@@���@A�T#|��@CSh���@D ל�e@EAɸ��@Fi�^��@G����J@H�]��!@J2΀��@KD3}�	@L��/�>@MՃ�p�@O&���l@P?��N@P�%�'�@Q��IvN�@RR�3?��@S	xz�@S�����@T�r��@U=��rIn@U�&�;�R@V����=@W�����@XR�Q�F@YI��@Y�(c@Z�o)�d@[�0&�Z[@\dJ1��@];��b@^iAA�@^�^��@_ύ����@`W���        ?�k��B?�xN�}EB?��I5,	?��^*d6q@ ��+���@�y�x@z:0��R@25}Lda@!�
�@��[�9�@",��@%I�0߰�@(�1hR~�@,|�Q��@/ń����@1�@:N$@3��by�B@5��Dc�@8�a�@:N^G�@<�iD_M�@? �&;��@@�q���F@A�7�B�}@CH}�ds@D�V�m@E������@G[^x�޹@H��ш�@J9�����@K�D�)��@M6����@N�E�}H@P'��R��@P��.d�@Q������@R�J\�1r@Si�ih�M@TB��c;�@U��B�@U���/j<@V�T:2'@W�E�*@"@X�i-B�@Y��!n�@Z�0���@[~�:���@\t~���g@]mFI��@^i�f�}@_g����@`4��ř}@`�8��z@a;i{3s@a�O6M@bF���r@b��]�@cX�*	��@c�i���@do�8;	�@d�%�ǰ�@e�����@f0'�D�        ?���C3?�#�\��?�<I���&?�q�j{?�;_ֵ��?���T�J?�P�@��g~��@�Q�O�@�z�9@��Lڳ@P���^u@DPz��@a�F��@��@���@ ��K��@!��o��9@#�8jm�@%�$��l�@'�&�(3�@)�����{@+��+��@-�?��^�@0.r�'5@1;N[�\�@2hؒ�Qz@3��7�|�@4٘���F@6�'���@7fTb�l)@8��u S�@:!���[@;k��h@<�9�ʷ�@>:�U��@?��k���@@��o�
@AP9v�_�@B�R!�@BְJ7lt@C�f��ܠ@Di'�2�@E6���C@F�[�c@F�z�L�@G��;���@H����	@Ie�⒒T@JD)z��@K%�;" [@L	�E�0�@L�b��@M���q9@N���<�I@O��_�Yh@PSp,t@P�D�-@QHR�m�@Q���TL�@RB�-�M�@R��dV:�@SB�[�v@Só�{�        ?���Ar�?Δ�Ϻ�?��'=��?�g�l�+�?��j}�$?�nք�@@�KC��@	U��oyF@��t?5�@C�"�[�@:�<��@�X���@g@���O@"����@$r�5��@'��	M@)�l+C��@,��0I9@/��x 
�@1J��u�-@2��=@4��{�i�@6Bo�Ud�@8�=gny@9�\>/�@;���pZ�@=�pP�~@?�}RU��@@������@A���v7�@B�%�*j@D�-���@E/����@FUQ�xL@G��6u�H@H�P���@I�ԠP�@K'B���@Lj�Ќ3C@M���mu@OfY�.@P+n/�@P�wo���@Q�H��@R:��J��@R�&�7�@S�#�a�@Tb�F�Il@U �6C�@U��^�@V�jQѼ@Wgp�"�E@X/\��@X�h� )@YŬ�u3@Z���e�@[fCe���@\:: �@]��:�@]�b���@^ĉV�w�@_�����@`@��3U        ?�z1��?��$�(��?�h���;?�FII�?��$6��m?�p�8h�@�E�~�@��<p@���@S�{�|@����@����@�w��@!�!#��@#n���m@%�j�k29@(q���S�@+!��Q�2@-���@��@0n"�y��@1��'p@3�(�K�@5'�2%O�@6���7@8��Č=�@:^%20�@<5�⿌W@>Z��@@�i� @A䏠jM@B
�a��@C~"�A�@D&�|9�@E>O���@F[���,@G~��l݊@H���I<_@I�'�5�@K
M��
�@LC�[J#@M����@Nǜn���@P��?n,@P�>����@QZ]�#}@R
\]@R�=�f�@Sg��ך@TM��U@Tҵh���@U���heI@VG�z@W���ep@W��C�K@X�L��=@YK�Yb@Z��Q��@Z��frK@[�A���@\t�բ�\@]Dk�o��@^:�@^�*g{�        ?���M�?�)�o��?�g�3���?������@ ���X�R@N��_�!@" =}>�@���@��+!��@6ӭ���@!��7<�@%�A��@(_Ҩ�0@+ٌ�؍�@/�\�W@1��u:� @3�D�PB^@5��}^oO@7��r�ӟ@:"�U4>@<qȂ��@>�\�?@@��.KB�@A�K��:@C1�Y��@D���b4.@E���ϥ@GF\�#H�@H��a=��@J'	�~7@K� "�a2@M&����z@N�����@P!�f���@P��|�@Q����@R�����@Si�l���@TD����@U"���d@V�Y
�@V�k�z3|@W�9![��@X�:���_@Y�i"�o�@Z����L;@[�(0ˀu@\�� �yn@]�9B�@^~Ξ��6@_c���@`Ay5�2@`ĺ��rj@aIr^��@aϝ�Xw�@bW:�=�@b�F�)T�@cj���@d@c��e7!@d��ǂ�h@e��#6@e��yso@f3�x:�        ?�5�N�?��n�4?�%�ď��?�5�0{?���7#�L?�j���G?��L
�@����w@g:���<@r0�c�@m����@N�\Ъ6@Z1�z�@�FV��@�łF�@ �^-�r@"�Y݋�D@$i��	��@&^	<�@(b�͠9a@*w<�eBA@,�5Д@.�$����@0�Ҍ/��@1���S�@2ބ���$@4.#��@5P�x%#@6�v�7��@7��&{@9,��'�/@:�^���@;�S�+�@=@G��~�@>�!��\�@@
��t��@@Ė����@A���3�@B@[I0�Y@CZ� �@C�7L@D�b~��@EXZP>� @F$�\Ui@F�|;=�@Gŷ~�Kc@H��K��@Ip��1@JI��j�@K%F�n[�@LE�jI@L�.���@M�p+�v�@N���t��@O��C@P>a�j�@P�g!�@Q+�_�H@Q����@R?fb�;@R�Ï\@Sc�P@S�t۩	        ?��v�:�?ͼ դ��?�/�9HX?꬜�U�?�LpH��?��M�K�E@'ĵk�@��T>��@��hPs!@�����@_���f@Nv��,@�/���@!j����@#ކ���@&^�Y��@(����|@+�2��k�@.�r���@0�Ϟ�
@2\��V@3��lx�(@5�݋��@7]S�Sf@9$�!U�@:�8\/�@<�>�ͭ@>͹����@@e�w��@Akj�Y�@Bv���/Y@C�	z�@D�^
��@E�����@F�E�A@H��^ܱ@I>��F@Jt�u�@K��x�܂@L����@N8��#�@O���z�@@PkM�� �@Q�Ɛ�@Q��L�@Ru��q�l@S(�M�tz@Sރ�C[�@T��v�^@UQ^��"�@ViN�#�@V�����@W��O��@XS��t'@Y�aP|@Y�Q��N@Z���e�@[y��j@\H���7@],��A@]�b�ak@^��%��A@_�2�w�k        ?����>�?��O�m?߲��	!+?�.ݹAx?���r�?�@	*?��@��Z� �@	1�.j@r�E��@)�*�$@�Hmn2@�<KD@A�ZR(@!�Upb�@$]=�bT@&���@)��h��@,u�a��@/i����@1>�7{~@2���[^n@4��t�Ώ@681ZI��@7�����y@9ӝM۟@;��k��@=�i�e�@?��s�<�@@�qk"m�@A��#�G�@B��)�8"@DP�3@E7e�s�@F^�t2@G��ZǋS@H��_%>�@I�Q{ �	@K;֥�*B@L�o��IF@M�	4T}@O!� RQ@P<�Kl�@P�;*R�@Q�Dq� @RR��E�@S
b��.@SĻgG?�@T��T��@UA�e�i
@V�]@V�.��(n@W�����@X[C)my@Y(/n�q@Y��S�<�@Zɱ�f�@[�;��@\uCy�C�@]N��S�@^*�Q���@_	��Q@_�ܩ!ɴ@`f�+�        ?��[�	 �?��8~^�a?�~9��?�X/�g�@ ���e1�@�w�{r@�Y�1@y�i&�r@wm��k�@�\@�AE@"d�����@%�%����@(�Q�jH�@,ew6�@0!��(�@1��s��=@4 GG�Y@6Lb���@8F��f@:��A@<�r-�p@?=���K@@ٟ��@BS8��@Cil*��}@D�����1@F]��R@G~F�9�-@H�7�9;@J]��&��@Kط����@M[�y��@N�}!r�@P:��)�>@QI�s��@Q�|� p{@R�SA@S~�Y�@TW;-�~@U3�l�"�@Vb�)D�@V�5�P	)@W� ����@X�8^3@Y�����@Z�����I@[��{��@\�{ԇd�@]~���@^xd��@_u�9�e�@`:����;@`���@a>ŏ�Z�@a�΁�'@bH+#Q.@b����@cV�.!�@c��0�@dj�k �:@d�hȖ��@e�uqb��@f�v+�_        ?�K�ɬ}�?������?؟�I{�r?�����"�?���x�?�F�)V�C?��1Xʮ�@嘵���@g���[�@LDd��@�6��=@���d�2@�g3M�@���J��@��� [�@ 0j"���@!�0���@#�v'�'@%���AK@'�n���@)�.E�@+�����@.S��i-@0&�8g�@1K��Z�B@2x��lK@3���-(�@4�&�Rc`@6*}�+@7s�a6�?@8��=�_@:Ӵ�~�@;xX �q@<�cR-�@>F؅o�F@?��߇V@@�M�).V@AU�W�i@Bn�@B���?�4@C����@Dm���[o@E;O/4ڿ@F�Jq �@Fޖ��*�@G�v���6@H����p@Ih�g�7�@JF��"�@K'qװ|�@L
�����@L���3�G@M٢E��6@N��p���@O���E��@PQy�˭E@P������@QE���H�@Q�gb��F@R>{,�ְ@R��D̷�@S<2�9��@S��1@��        ?�/鯩�?�ɍ'�@�?�5S.*�d?ꯠkb�W?�O��\�?��`�b��@,m|���@���D�@ɩ��t@����@j�)<ӓ@\�z�ܜ@���E@!�ai	��@#�	���@&m���(@)��1�@+��*@.�oA�u@0�(.��@2i@N@4�g�@5��'��j@7lȫ�[@94���[�@;
�CG,�@<�$j�hZ@>��ކ^@@nbպf@As�Y��@B�a38�@C����@D��Rf�@E�Y�k�6@F�BF#*�@H:ف
n@IJ1Q��F@J��v@K�Я��@M U�X2�@NH�����@O�wY�"@Pt�-㩭@Q!����@Q����<@R��
�xK@S7�ӄ��@S��A�+@T����L�@Ue�ŧ"@V$���-K@V汃jr^@W����@Xr	@Y;�,�lX@Zz�o@Z����H@[��Ev�+@\z3�;9�@]P�$ǡ@^(E�!3�@_�b�.�@_�
�["        ?��L</�?�	LQ��?ߢ+D
�?�>�B�?���C.?�''{~��@��q�@h@	S�:W�@W����J@v�y(%@�J�%@ٚ =.@'�^bE@!ަ�5�@$K�.��@&�1t$��@)���$�@,\m~M�l@/M(�ƥ@1.��:�q@2��I�@4lga4�@6!��^�N@7妴��@9���Äo@;�Z���p@=������@?����R�@@�	1#�e@A�b�,O:@B�Fd�ڨ@C�����@EM7Ih�@F??��@@Gj\�w��@H��b�@Iҳ����@K�w׏�@LR����n@M�+� @N�d�XF^@P��i��@P�?n=�P@Qz�L�@R,�k�R�@R�erl�@S���;r/@TR��!@UF"v�@U�ib3?�@V�]7�c@WTY&�P@X�a]@X�U���(@Y�	W��y@Z~,��]@[N�4> @\!��]Ț@\��.Y��@]·
Q��@^�nI1��@_��Ep�j@`1�I��        ?��}V֖�?��&Zo�?�=[�	U?�jس�n.@ L���?@�b��E@� $�@�{]�@�(䀦@��
���@!�M��-@$�"�zP@(.<J��@+���2@/P_R�@1�zZD�@3��ݼ{@5��4��A@7��7���@:����@<l$��@>ӡ<fQ�@@�`K��@A��<�@C=I-�@D��Rt�G@E�N���@GaT5G��@H���V�X@JN�?�B@Kѝ��@M\�1D�X@N�m2	�@PE)���F@Q^g'i`@Q�Xܼ�A@R�
�h;�@S�f�0^�@T�`���@Uc�%v�@VJ�dsJ�@W5����@X#|��|#@Yսr�@Z	�naV@[��@�@[�˶wr@\�Q��v@]��ǯn@_�c��@`1���@`��W26@a���@@a�q��|7@b$���\@b�T��q@c=��A�j@c�(�J��@d\@:Un@d��T=�R@e��m�@f�RB2�@f��7�i�        ?��O�В+?� �PC>?�,UP��s?���Z??�Vw*�?��<���?�����I0@Zi<���@��b���@o��F�@BQ9�N@�%�m2�@׽'�x@�5��@n��}@`�N�E@!kp�q�Q@#8G�t�@%�?��@'2�تF@)]�C:@+"�&�{@--*&:�X@/Y#^U[4@0��@m:@1�e	�Ѻ@3��k�`@4L}q=�l@5����@6�韍/�@8�b��a@9Y�/#�"@:�d�F�t@<K�<ć@=ge�'N�@>͚��@@�,�d#@@��N�t�@A��}��@BP̠lV3@C{���p@C���tr@D�3A�Y@Eh.%��@F4�Hx@GG�ǵ�@G�Xxsr�@H���y@I�a���c@J\O�Ŀ@K8�~�@L�9��@L����R�@MݵV�b�@N�d#;�@O�����@PL�t��@Pë��^@Q;���#@Q�i�O֗@R0�Y@R����^�@S(�*�$        ?�kZq���?� B8%�?ߍ�ŵ�?���d%>�?�a�.^?������@b��-��@�jY%e@!�_m�@�BIU=@��=��@�ic��n@�6K���@!�b9���@$(�,W�I@&��G��@)`m���@,-x0G��@/��=;�@1����|@2�c���!@4N}җ�_@6�+ܾ�@7��!QY@9��@�B�@;w�u��@=f|(��@?cG&��@@�CU�@A�Os_�<@B�i�MIH@C�@T��@E�F�o+@F7��;_&@Ge��|b@H���5ۿ@I�cM@K�F,#2@L[�F���@M�#٩�@N�rqc�9@P*�l�R�@Pڕb�A@Q�=GH��@RB�:�M�@R�c&� @S��4X�@Tu)y�IY@U6Z	��@U�a��	@V�:rR4@W���@XWM�.@Y&~���@Y�n�w_�@Z��q�?@[�w�{l�@\~��A�@][>��@^:��NH�@_�+���@` ����@`t8���P        ?��X}P�T?�`g���?��4�=�?驯�pso?�J��W?������G@z$5j�@���c�@�|��8�@#�7y'@�e��$U@fڡ�pQ@w�����@ �H��)�@#/%a��@%���	��@( Ǝ̟@*�!�Hb@-���-,@05�2ާ@1�o�@C�@3@�z�!@4�	q��@6����"@87�Ro��@9�n��uY@;�1Յ3�@=���9@?���,� @@��N4�@A�'��y�@B�[��@C�u�0=�@D�_e��e@E�P{��@GTX���@H<9C�N@Id�;��B@J�z	��4@KŲ-�5�@L�8'�@N;��Z�@O~�S�:@Pcz9G@@Q
���(@Q�l�]@R^�3��@S���@S��n.`�@To���k�@U$�p��c@U�]&�G�@V�7�^�@WRb��b%@X�"�@XяT).�@Y����F@ZY�'d��@[!r�%@[�XH+@\�a��@]�>���@^T8}�#1        ?�+��?u!?�jj�#Dv?蜂��?��dc�P@ �x�@���5-@-�x��@_�Xix�@���}�@P��>��@!v���@$x�ʭm@@'�wЍ�@+i�r��@.��5���@1+���D�@3���@5$���@7?�����@9m���]@;�h�k��@>�Fo� @@3[h�\�@An�A��@B��C>T@C�Sf@ES��U��@F����z@HSs�N1@I��%5ǌ@J�Kb�@Lr/37�@M�~HT�@O�Ȳ�@P����0�@QUZ���@R%B\~%2@R�����@S�O����@T�]�S0�@U��W��@VgU����@WK,�M�:@X257��@Yd�XqD@Z	�epxQ@Z�>��t@[�1Di@\����@]ݍ&{,�@^�
�H�@_�~���^@`m�6��@`𗿢;5@at��W��@a�2
B~�@b��*�
@c	j�;�@c�a�@d��}�@d�wm���@e8#��8@e�Mz��        ?�,����T?Ɛٳ�m�?פ{3\ū?�&Ts�G�?�?X�?�k���j�?�����@9qy��=@��z�S@d�#��+@F
c.b@P8�t@�Zy`l@	�u�@Fo�z��@��\R�+@!�&��>@#o��|@%V@
[��@'N%�@)VV6kĨ@+noܼ�|@-��:�7@/��>6G@1	u�
��@23@3eH���T@4��H�@5ݐA�
@7$�u	�@8qZZ��@9Ś�G��@; Z��^�@<����C@=�os�@?W���3:@@f��@�@A#a��R�@A��r���@B�I��M@Cm�b��L@D7A7m�@E�"��v@E������@F�u� �@Gz�XNn@HQ�����@I,\�w�@J	����0@J��'��@K�%��A@L�d��rm@M�=53q@N�����@Op�M-�K@P0�vȷ@P��o��@Q#3�@�@Q����P@RQI�І@R�4�[=I@SN&�8�@S��68�K        ?��d@� �?�&O����?ޓ�v���?�*��`	?��7����?� SuU�@�\x���@:[��@?����@o�W�k}@	����'@�9W��@&�>^ @!A\���.@#���N�W@&���"�@(��b�/@+dux�0	@.;��3@�@0��k�@2"�"@3�b�v�@5aر���@7��|x@8��W���@:���u�Y@<����L@>t)�):�@@6WjԶ[@A9���?@BB	-{_�@CQD�_n@Df��ȴ@E�2�,a@F�Np mv@G�py2`�@H�QJ�-�@J)�����@Ka�KQ�@L���d1@M�w�v@O*��P>@P<B�uI6@P�x�A@Q��s-e2@R@#C���@R�&Ŕ}E@S��6��@TZ��&��@U�Z�G@U͘�e�z@V��TE�@WJ ���U@X�}�ؓ@Xπ|�]@Y��b�@Z]���d@[(+��@[���T@\�6� �o@]�ӌ��@^fvNu�-@_;r���        ?��sSH�X?��鴉�?ߚy���?��!|G�?��.��A|?�6T��@���b�@	2��	o@z�}�h�@2ml�@�-{��@Q�]@aG��@"��-��@$x=�¥@'՗G\�@)˴߻�@,�8CL�@/�Įˆf@1a��t]@3 �s��@4���zx@6m��M�@8;a�`�@:�Or�6@<Zn�>?@=�a��~@@�>��@A<�{&@B �.w�9@C9�C�_�@DY�H�@E��Q��]@F�w��Q@G��#;�@I��o�b@J]X�:��@K�s��A!@L��c\m!@NE6D�@O���am@P���@Q1��:��@Q�I�q��@R���l\�@SZ�����@T��G��@T٫���@U�!m�U@VcDE�% @W,O���@W�n�r'�@X�f��1@Y��hz�@Zh�'ɤ\@[>��ŴS@\�R\�@\��EV�@]���ID�@^�� � @_��4�̴@`90Onj�@`�Al�        ?����Pʄ?׷�\�w�?���!V�?�X	9R	@ =c��>@�Ϩ��@���x��@�l�@qME�b(@��ܚ�Y@!�����@$�)x͙�@'�YJw6o@+_^\]@.�D�_�@1\&��T:@3Q�����@5[ܕ,�`@7y9÷��@9�z(�X@;�ٓ�@>@���0�@@SY��@A��QR#i@B���q5�@D��ȟ@EsC��G�@F�aUl_�@H3A��AN@I��5�9^@K؞n�@L�^;�-�@N?�GN�@O�eK^7�@P��f�J@Q_��֛@R.�ȡ�s@S`/��@S�jQ���@T��^O��@U��S�@Vm� �s�@WP���@X77�U�e@Y ғ^p�@Z���9�@Z�c2���@[�G����@\�3�X@]���.{@^�9"�@_��\�a@`m�K@��@`�����@as����@a���P�@b}�~@cf�#r�@c���J@dZܓ�@d�`���@e4���7e@e�sߎ��        ?��CT
\?�B4���t?�[���TP?����ъ�?�r
E?��	��?�Y�̕H�@�mYO��@E��o��@.}��}�@����@�Q���@�F�`@�ᜥP�@
V���@ B �4�@"/���@#��R �b@%�`|��@'�e��@*�t�U@,.���X�@.gmoc�@0W�#�T@1����@2����p$@3�Tcɴ�@56��F@6� �æ�@7�@5��@9)V���@:�C�na�@;��l��@=Z&���7@>���+_)@@#�-��@@⿾�>{@A��;�`�@Bk{)0��@C4l���@D a%7�{@D�Q�S�W@E�6�o#@Fv���@GM����@H(J�#��@I�_�>6@I��%(��@Jȴ�̏�@K�V?;�Q@L�����]@M���f�@Nofad�-@O_����@P)\sNK@P�&��;@Q <	'r@Q��)���@R;̑e?@R�!��@SE�Ax@S���kb�@T#@JKH        ?�{y��?�?��T�?߱�jY�?��@zt�?������?�Ҡ,Q�@}:���N@	���_@M�i��@�p[ @��9
�@�g��U@r��9@!�H�O8@$B޺�rb@&�Y��9@)~�OY@,Mm���,@/;�kI��@1$���@2�X�_�+@4_��h�@6�2q{@7�iӉ6�@9�wm�/@;�{�{��@=n<�C�@?g�X!�@@����@A��+��@B�2a�u@C�ݑz�@EΘK�@F'�;@GQ(��@H�h��?@I���@��@J��gU@L1�0-@Mx/�F��@N�x�?��@P.�ZRn@P���;�c@Qe\��!�@R�1��c@R�]�<"�@S��G�.�@T9뤏:.@T����o�@U��D'#�@Vty�϶u@W7����g@W�S�,ѫ@X�j����@Y����p@Z\�0��(@[,�h\�@[�����@\ъƣ��@]��:�u�@^�:���@_Z�6&D@`���v        ?����Fk?͋�u(!�?�%9�f�?�:8ʖ�?�SX{v%?��6 *��@/���@�����s@���@�j��h�@_o߹��@I���T�@y��@!u�4'�@#Ϻ�F�@&I���IY@(₞(V�@+��_�HS@.o>�3�#@0��љ0I@28wM�4�@3��!�@5q~�Ƽ�@7"m"� e@8࣑�
P@:��e���@<��P�V�@>h��L�@@,�<Sw@A+,�`w@B/����R@C9��{7�@DI�3��@E_K&�}@FzѬ��@G�eW?��@H�ī��@I�肣'�@K���0@LO���R@M����M@N��� =@PTӟd�@P����ø@QQ6%�;l@Q�&�͈�@R�c��}#@SR��3^m@T�Z��@T���yɇ@Uh�#�@VC�/�@V��Թ��@W�}�,^@XOG?�@Y%S�S@Y�፸=@Z�v��@[V�cXr@\�**�@\����B@]��$��j@^~���ӧ        ?���W��?س�ds�D?��� � ?�.��W�@ �)��,"@�3i�@�
\t{@Z!I죄@SPߠM@��k��@"O�{&Q@%s��R�@(�;&3�@,Q1�j@0U_��@@1�y��@3�Au�a�@6���>@8G�+�@:��7]�B@<�H��@?L��U@@�1�:$@B+]����@C{U�~UF@D����@F4�7Y�)@G�(ڽ�@Ir��@J���kgN@L	~��H/@M��G��b@O!ʮ�l�@P\x��c�@Q+��u�@Q�T~�.@RԁmVl@S��k�N@T�0/r@Ukx7��@VO$*�T@W6"⁥@X Iʁ*W@Y��i(�@Y�5�@Z�ئ~��@[莊��@\�L���@]�
��^j@^��"uٍ@_�gN(߯@`s}9�k@`��:;B�@a}g��n@b���u*@b��z�U@c�h��@c�A�e�@d.� zW�@d���'�@eLZ��"�@e�ˋҏ@fo�-Bu        ?��
���F?��[���?��b�~�?��ĄY?�)U2�?�Կ@4.E?�3���@��Ά�@ M\�^)@ֲ���}@�ӣCش@MZ���F@?�br@[�*�@��FN�@ ����@!�P�Jŵ@#��)k|@%�ǖT��@'���(@8@)�z�)U@+���a�@-�'�-@0/OyW�@16X�F@2d$ψi@3�yI�G@4�8���@6EvW%�@7e����@8��S��@:+���@;qdǨ�w@<�j�@>F!o˨�@?�o��`<@@���U; @A[2	�X�@B�jޞ�@B��Bd@C��[��@D|���#\@ELb�]�@F;�y��@F�̯@Gͷ-xj\@H�M�a�(@I������@Ji(�@KM#ܾ8�@L3�{z�4@M�\���@N	ߪ���@N���*D@O�e)r�@PoI,Y�2@P꩎�e@QgO�t�?@Q�8���@Rda��..@R��=u5l@Sfeŝ��@S�9H��w        ?����~�?η�B��?�����?�=s�?��ɦ[�?��Ii�ߴ@Έ@���@	KÈ��@�S%!Su@jdF^�@8X>`/@S.���0@�Ư���@"5ZV�@$�=]�}�@'P�됖V@*��ǁ@,��0��_@/���n�@1�����@33�\�'_@4�g�M�@6�� �@8z2���@:Z�`��T@<JJQ��W@>Hd�1��@@*tiSz�@A7�����@BL.��@Cgr�K�@D��ش��@E�Q驓!@F�ۈ��@H�xp݋@IT�+h@J��$W�@K��gO��@M/ ��	7@N��54�4@O��v@P���lF@QT���@R4�߄�@R������@S�F���T@T@���@U��e@UǯÕ�j@V�b�Z2@WYң�!@X&�їMz@X��Ѳft@Y�J��V�@Z�h�U��@[v!ݧ�@\Po���@]-K�<�@^���̖@^��#@_����4�@`\�}�[O@`і�wvN        ?�6��X?����]�?�t��pY?�D�:P~?��b�I1�?�ㅍ�\@�\R*@&v��q@"���<@[>lg�@�Ld@Ʊ���j@�SP#�=@!"I4�Ɔ@#r��؉�@%�5M"A@(r7r��U@+�Z�,;@-�p��Q�@0is,��@1�*����@3{����@5�e��e@6�vkͥ�@8{g	�R
@:@0Ki+`@<�C��@=�cC#�#@?�]�?�@@穏�p�@A舨I��@B�3��:1@C���К�@E���k@F%�@GB��D�@Hd~/�@I�5O
�C@J�.�"Y@K�V�Ǖ-@M"���q�@N^��ˠ@O�9�ql@Ps7H�N�@Q�Bom�@Q��[��x@Rj�r.W�@S��7L@S�eNL�h@Tw���د@U*�F_�@U��6��@V�\�`|.@WRP�	��@Xe���S@X̖�!w�@Y�ܢ���@ZO1�j@[���@[�퇈�-@\�K\��@]l�����@^8��s�        ?���gSX?�9�6���?�xeZC��?��:1�Y�@ ���~3�@fd7q��@G��xG@���@	w��l/@s4+"Z�@"'�0o��@%MIe�&�@(�|�Ҥ�@,4|@�I�@/�k���=@1���Ba@3�ObN{@6!aG�@8ZRk��@:��o�@=�5d�@?�f�8 0@Ap����@BUEI�,P@C���'�s@E��m�@Fy{��!�@G�ꌈX�@Ii�z=X@J��d�o@L{3�d}@N�+���@O��5&�@P�ZN���@Q�W�KR@R\E*2='@S;��o7@T�Tnh�@U ���"@U�G^�.@V�dU#�@W͚t!�@X®!���@Y�Msܡ4@Z�j�rb@@[��Ctb�@\��gU��@]�>d�~+@^��Gd@_ֽZ�#n@`sk/��X@`�SP��@a�?wl��@b��Z*�@b�A��Hk@c3
�R4�@c�U(��@dW9��@d�_�߸:@e��BO@fF=�s�@f��vR,�@gJ��oj�        ?�f��M�,?�ӧ���4?����&?�m��x�?����{e?��K(��?��`���I@���r�@!�M@��Cx�@�=O�@ff���@d���l'@��u��@�/�5A@ /�X�@" ���_�@#�s�%@%��>}@'����~@)�q>��r@,+!N��g@.g�8���@0ZVZ�L�@1��\�p�@2�wc`�@3�ȦR~�@5C�:�J@6�A���@7�5��[�@9B�t<@:��#��@<�H]N@=����$@>��:=��@@=�)�c6@A �L�bo@AǇh�Z�@B���6@C^���vU@D/L @E�p9�@E��h�@F����/�@G����@HqJ$��@IT|{�6�@J:��R<�@K#���@L��dgF@L���9��@M�A�݃�@N����0@O��ɣs�@Pj�5�@P���gg�@Qhu员k@Q�@��J@RkS]@Df@R�;Y��@SsBL5��@S��/?@T�*(�G�        ?����d�?�2(��~,?�]*YtO?� �8�
?�RFc`m?�S��@$��x	@	�.�@.��mu@�m��{2@�b'U�^@��n�A@ *�dF�@"t/J�@$�
kf�A@'��S�;P@*b���I@-J����@0*M��V-@1�\r�ң@3dV���-@5� H�@6�oJ"O@8�\٤�@:��#2��@<��Q��#@>�f�J@@H���O@AV���r�@Bl�U0 @C��1<�@D��O��@@EԘ�9Q@G�+. #@H;��N�@Ix����z@J�6�r�@L�9|�@MU�J�d�@N��79�[@Pߦx�y@P���7�@Qh��Z�V@Rq�T�U@R�
��h�@S�s���@TT�l��@U�U�@U�5l��@V��v��@Wl���W@X9%�E@{@Y^`��@Y�+j� �@Z�����@[�nO^pP@\^��04�@]:� c��@^.��@^�~#�(@_�c��@`a�r���@`ժ?��        ?�r�f~�?͏)����?�7Px!��?���KN?�i�Z�~3?��-Y%�@M�0{% @�s���@k�3gH@�l�E/@�ŗ��@���o��@�}x��J@!��	'[[@$4e���@&�0����@)F����@,�V<,�@.�Iv�4�@0��>���@2���M�	@45Y�6�@5��6R��@7�A=i?[@9r��T�@;N���@=7����4@?/���H@@����0@A����i�@B��[`O@Cǃ��1�@D㊱5��@F���@G.?4�oJ@H\�2}W@I�A�Rr�@J˧�c[�@L�@�Z@MQ�'m+�@N�~��@O��p<�G@P���nB@QP���@R�k\��@R�D�-�W@Skl"���@T$/�wnH@T߇��C�@U�m"XN@V]�J[ѹ@W �	�@W�% (�@X��q<�@Yx8�r��@ZDܩ��?@[�c��@[�;0gł@\��N��@]��*�@^g(E���@_A��K�@`3�{~�        ?�w���J?�����	?�f��~�9?��L��l@3�5��R@B�|�+@6��(�6@�����@��dJ'^@�c��Y@"�%��@&6�J@)��(��@-3'腼@0���@@2���fB@4��5��@6�n7@90k�䯼@;�o >@>�ch�z@@J#�^�@A���h;@B�ʂI1@DW�l5@E�孄�@G:"��YK@H�����@JB���c@KӊE��@MmК��@O����@P^/s1��@Q85��R@RgC|�@R�����@S�me0@T�o�_+�@U��iD,�@V���U5$@W���q��@X���W:@Y�$�8"@Z�GC@[���ِ@\�O�fk@]��Yi@^�X����@_���^@@`t��U�M@a- ��@a�{��r@bh۟��@b��#�$�@cDqEp!@cح��F@dn��,�t@e���fw@e���<c�@f:���@f�հ��k@gt��yά@h�MP?�        ?�Փ����?�}4X="V?֋M�g��?�=;"��?�/@S��?�wP4^?�P�@���@|�ڵ]"@�f��[@
X�����@VҹuP;@W��"�@/!�X@0L.���@Y�?	�-@�����@!�Ӿ�@"��!ӻL@$��:z�@&���G@(���l��@*����q�@,��(��@/F<�B@0����f@1��L@3�Yf4@49����@5w[ �n@6��$�>@8	���@9\/�J@:���Ø@<~��v'@=}���;@>�x)�}@@/z���@@�i�6@A��GqҴ@BpH��~@C6���@D 4�! j@D̮2X-;@E�ԣZ@Fn��q�@GC�<L"�@H�����@H��Xcٞ@I�Ȁ
�#@J�e��P6@K�Ǆ*��@L~�"�
�@Mg�JU�@NSJ��%@OA}���@P*U�,@P����@Q�3��]@Q�:�ڧ�@RВd�@R���h�p@S�ڇ�P@S�+9�        ?��D椚w?����Z�|?�5�����?�N�t�?�H.X�?��$O\�@�Q4�n@	���\��@
����@�z��]@`(�`@�%}9@�lqQ"q@"O�HH�@$̸���@'m:ˬ�@*/�:.Ϟ@-<��@0����@1�"7�*K@3A�V\�@4��"�@6�ب���@8�"SY(@:d-x���@<Q���@>M�ˊH�@@+���A@A7�fgv@BJ1�@|�@Cc�\�i9@D�e�|s]@E���88�@F�y�w[@H	wgq�k@IB��`�@J�����@K�P!p@M���[�@Nc�~�	@O�߄)�@P��j�>@Q=^s�B@Q�}߱7@R���X��@Sbb%���@T�~�*�@T�K�\^�@U�]�g�@Ve&�%��@W,��V�@W��w<c @Xâ�+@Y�D�f@Ze7D�@�@[9�į�@\:bE�8@\�3�h@]ǂyB.@^�s�&dT@_��2ϊ�@`5���	@`�"	�`        ?���U�}?�<�2�&�?���� �~?�ͅjt�?�zpz5!?��sV2]�@k���s@���4�D@���L�B@
�y�d�@��q�d�@]U��3�@n^��Bs@ �ȳ�@#+Tv	`6@%�O�ݺ�@(=	�`@*�mu�3�@-�9�jcM@06�Y|@1��1��@3B�"�;@4��#��@6��T��@8:ùZ@9�T7:S@;�B��N�@=��!��
@?�p�*t�@@�#cM^�@A���@Bƿh,�9@C�D��W�@D�~`#@E�X!�d@G���"@H8�;k�6@I_��@o@J�ywКE@K�U~xc�@L�fۅ�@N1��:�{@Or�a�@P\�M��S@QOV�Gi@Q�oGT��@RT���"0@S��t�,@S�T��@Tc��XF@U&:g�L@U͐�%�.@V�J6`z~@WAN��9@W��/���@X�!q���@Y���<�@ZC�Wƀ�@[
!��s@[Ҍ�!I@\�$ɳ�q@]i�?�@^8ӼMT3        ?�%��_�?�s�TGy�?��&�?� ��:�@ rG'2B@�Fs�d{@U�<!F@}��|@I?Pnq@��2��@!��!�#@$���R��@'��n�@+[2��@.�}�
 @1d�l}�6@3a��%j�@5s���@7���@9�z�/�@<%��d�G@>�,���v@@~��#�@A��J?��@C����t@De��s1@E�~��D�@G+��xc�@H�^7c!�@J;2�>@K�-�.w�@M2ί�@N���U@P!=�@P�⏦�@Q��0��@R��bG"�@SuezTS@TS��L6<@U5X����@V��c1�@W`ֲc@W���~�@X�8榸�@Y�?p��@Zȡp�@@[�XN��@\�[v��N@]��ضX4@^�%��j@_���u @`i�Q�<0@`�X��F/@axabH�J@b�/��e@b�uX9@c����e@c�����1@d7"��hk@d��$�@eZ�}>��@e�eIW�@f��&�        ?��.}�^�?�r�_��?�+���?�����?�@S�i�?��	��?�2���i?@�#�;�@*|�B#@hD�H"@�9��'S@x�.-ɿ@s�:t2v@��#��"@�!����@ ,�v@!�c�5@#���	�@%�+�3�e@'�DT)N�@)շ2�r�@+�S���@.%�J��@02f�E�b@1Y6짧i@2�7�|{@3�=�@4� �/�z@6:��`�v@7����"@8�u�5�M@:)M���@;�H|`å@<�K?g?@>O<I�t@?��6@@�G�!.�@AT���l@BW�
�e@B֍b�<@C����@Dc"����@E-o9��@E�[ZL)1@F��LةI@G�����@Hp�3:@IG��~��@J!G�k_@J�����@K�ZH��@L��R�$j@M���<`@N�&�/�@Okw��V@P*��o#C@P�l�X��@Qc�V�@Q�i����@R{�hz\@R����T�@R�����@Sy�Χ?         ?���F[�X?ο܄��U?�s|��?�#�G�?���'?���F* �@̝Lt@	v��	�@ū7��@Y��v�'@Cz��u@-��#@��9̡�@"e,Wf�@$���⍁@'����c@)��S��|@,��n�j.@/��NW~�@1V�a\�@2�i�{��@4���Q@6P���"�@8����@9�� q��@;�B�k��@=����@?�vq���@@�k�l��@A�� g@C��e�@D����?@E;��E]@Fa�c���@G��Wt�@H��{c�I@I��.��@K6G�0��@LzR�_-x@M�(�7߄@O�����@P4|A���@P���e�@Q�'�\@RE�~Oh@R����@S���@Tn���@U+��UG@U�ܘ�J@V��Ib @Ws�ƒ�=@X;�i�
�@Y�"���@YҤ����@Z�Ò-m@[sI���L@\G1!�43@]t]J�@]�{��2@^����v�@_�.� @`F֚��        ?��ܑ�0?�̪��E?�q�kV�%?���MB�=?��.���?�=m�I@m�[�I"@	?%�v�@7����@�Y��@�iT��B@�OU3`@��%��@!�%�2��@$5y�9�@&��w!� @)n����@,;�0ׯ�@/)1,�#
@1ʈ�b�@2�Q}�\r@4T�m��@6^�0�K@7�gͳC@9�̆�6-@;yU8o�@=e�il9!@?`�t�@@��mMB@A�ow��@Bϐ
�B�@C�.�g(u@E5��?@F)���O@GT)Rԅ@H��qnH�@I��}-T�@J���vc	@L;���ӕ@M�l=}�@N�Wca�@P�#��@P��X�@Qp�q�S@R#|ޣ΍@R���5n@S�Grn��@TLF��Ǌ@U	��@'A@U�V���@V�Z*?b�@WR����@X2�`�@X���n�@Y�Di�.[@Z��R�@[UYYw�N@\*K2�	@]8P-�T@]��=��@^��מ^@_��?��>@`:�5�b        ?�>;��#m?�:#���?�YK�\9?����@A���@NC��N@8�<�e�@��l>�@�b�EC7@lghI(@"�t+�d�@%�"��`|@)K��]��@,��P�-@0S{�Tޙ@2Lm>6�f@4[��V�@6~��)�;@8�[:՛@;���&2@=`}11\�@?�Ɗa��@A*���|@Bu0B(l@C�g����@E$�,�q@F��-5}@G��;�j@Ig�io	@J�~�p��@Lf�e�@M�9
�Y	@O����@P��+�SJ@Q]��:@R1[�T�@S2���4@S�iͅ�@T��ґeE@U�����x@V��Q�j@Wl,�V@XV��)@YD6E/]�@Z4�J(��@[(��.�@\X���A@]d��@^�P��@_D%�!r@`�R�@`�u��&�@ay�B�3@a�޵d.@b�ჺ�@b��]J�@c0)5�T@c����@dF���S\@d�=~��@eb�j'-�@e򦉩H�@f���U�h        ?���;{m?�>��%�?���ǗY?㹀fx�?��7亜?�+��&?�Xf�5@�	qu��@E��v��@
��̳�@�WoF�@�WG�(@�T��q�@��c�@�b<'G@<��
��@!\Ҷ!@#+"\-?@%���@&�n�c��@(����l�@+�(�%@-*�z���@/X�<8w@0ʊy�3@1��^Z&�@3_�ab @4O��h��@5���sL2@6�.��e@86��0@9^��%�@:�46-��@<��3�"@=k����@>�h!� �@@uB� T@@�{��@A�|E��@BP�q2�@C��58@C�E�@D�T�c
'@Ed$h+��@F/�C+/�@F�s�f-@G��`�K�@H��F~��@Iv.��_p@JM��!6�@K('���\@L�ů�s@L� �Y@MĤ�BԐ@N���=@O��g,T@P:��eY@P��v	�V@Q%� &�q@Q�����>@RΆ��@R���R�@Sθ��        ?�6dl"]3?�� ��e�?�vHq�
�?��t�\�?�~8�BH?���G��$@Y�tf@��"���@T�mb@�9p��@�8�W@��d�@�����@!�xa�*@$V�}�@&���ѭ7@)7:�'��@+�B�#@.����@0<ǫ@2~�?�co@4Ӵx#z@5�?��@7�~���@9K͂'{X@;!Ж�'�@=Tg��@>�(g�s�@@z f
@A~�g��@B�KM�^�@C�ZՓsh@D����4�@E���:a�@F�*��b@H"X\tk�@IRX�[�@J�1�'z@KÃ���@M��ys@NK9F��@O�|D�@Pt7�g��@Q�||�@Qͅ���R@R~����@S1*!u��@S��[�@T��x�@UYZ|KB~@VC��eA@VՊ1е�@W�$�@X[	��YK@Y!386[i@Y�9�8@Z�0���@[��a�h@\O�\���@] �]!��@]�I~�<@^�F��@_���b��        ?��q�Im�?�1�$�Տ?�����<?�_k�:z?��M���x?�}�e�&@������@	mD�[��@����2@[� ���@%�[
�@<7��@��/z�@"#�]]�@$�.�No�@'7���:@)��Ā��@,�����5@/�t��@1{:V[�W@3��w�}@4��8�@6�ޗ�p�@8[�4�@:9N3'�@<&yQ��@@>"T7��E@@TC
a@A"�"��<@B5�K�]7@CPB�\�J@DqkaUx@E�[�n(�@F�����@G�;]���@I8�w=��@J{6t��@K�ͣ;G@M�vJ]@Ng��:�o@O�`��@P�2��Y�@QE���B�@Q�s��y�@R��#�Ғ@Srd���i@T1� �}�@T���d�@U���^i@V�V�7��@WJ����@X�.�*�@X����@Y����s@Z��US-�@[fZ.��b@\@a���G@]�(nh@]���:;j@^�`>@�@_�E:�r�@`S��7 �@`�'(��        ?�U�q��?�)N�?�d8���}?��ey�$�@ ����@Dz�b�}@�d�:@�4��g@�8c��@���y�@!�Q��@$���Ye�@(3/�A?;@+�r5[�@/7����A@1|Ӧ	�!@3r*!�;j@5{R�H@7�
����@9�p�9{@<�.̡f@>W�'Z��@@][^]@A�74��}@B�>��b@D#E� �@Eu%!#u{@Fθ�b�@H/���c@I�la<�@KG7���@LG��G@M�Jk��@O�+��<@P��g?n@QO��j��@RX��'@R��U���@S������@T�:�h�k@Ul�����@VH����@W'N�n@X�!��@X�1պi@Y�\;,�@Z�K%"k�@[��
�K�@\�MÄ@]�P^iIa@^���@_x*��F�@`8�A�A,@`��a�@a6�NQ%�@a���9^@b8�e�J�@b��m&'�@c@E���@c�\c3�>@dK�l�G,@d�F�O�@e[ݸ|cf